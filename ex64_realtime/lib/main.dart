import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

late FirebaseApp fbApp;

Future<void> main() async{
  //이것을 넣어야 에러없이 에러없이 진행이 됨.
  WidgetsFlutterBinding.ensureInitialized();  
  //시간이 걸리므로 먼저 DB에 붙어야 한다.(DB선 붙이고 페이지로딩하면서 붙으면 리턴)  
  fbApp = await Firebase.initializeApp();
  print('Initialized default app $fbApp');
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EX64 Realtime'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  late DatabaseReference _counterRef;
  late DatabaseReference _messagesRef;
  late StreamSubscription<DatabaseEvent> _counterSubscription;
  late StreamSubscription<DatabaseEvent> _messagesSubscription;
  bool _anchorToBottom = false;

  final String _kTestkey = 'Hello';
  final String _kTestValue = 'world!';
  FirebaseException? _error;

  @override
  void initState(){
    super.initState();

    _counterRef = FirebaseDatabase.instance.ref('counter');
    _messagesRef = FirebaseDatabase.instance.ref('messages');
    //리스너 설정 - 데이터베이스 값이 변하면 앱에 반영된다.
    _counterSubscription = _counterRef.onValue.listen((DatabaseEvent event) {
      setState(() { 
        _error = null;
        _counter = (event.snapshot.value ?? 0) as int;
        });
     }, onError: (Object o){
      final error = o as FirebaseException;
      setState(() {
        _error = error;
      });
    });

    _messagesSubscription = _messagesRef
    .limitToLast(10)
    .onChildAdded.listen((DatabaseEvent event) { 
      print('Child added: ${event.snapshot.value}');
    }, onError: (Object o){
      final error = o as FirebaseException;
      print('Error: ${error.code} ${error.message}');
    });
  }

  @override
  void dispose(){
    super.dispose();
    _messagesSubscription.cancel();
    _counterSubscription.cancel();
  }

  Future<void> _increment() async{
    await _counterRef.set(ServerValue.increment(1));

    await _messagesRef
    //카운터 올림(데이터 통신 with realtimedb)
    .push().set(<String,String>{_kTestkey:'$_kTestValue $_counter'});
  }


  Future<void> _incrementAsTransaction() async{
    try {
      final transactionResult  = await _counterRef.runTransaction((mutableData){
        return Transaction.success((mutableData as int? ?? 0)+1);
      });

      if (transactionResult.committed) {
        final newMessageRef = _messagesRef.push();
        await newMessageRef.set(<String,String>{
          _kTestkey: '$_kTestValue ${transactionResult.snapshot.value}'
        });
      }
    }on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future<void> _deleteMessage(DataSnapshot snapshot) async{
    final messageRef = _messagesRef.child(snapshot.key!);
    await messageRef.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Center(
                child: _error==null
                  ? Text(
                    'Button tapped $_counter time${_counter == 1? "": "s"}.\n\n'
                    'This includes all devides, ever.',
                  )
                  : Text(
                    'Error retrieving button tap count:\n ${_error!.message}',
                  )
              ),
            ),
            ElevatedButton(
              onPressed: () async{
                await _incrementAsTransaction();
              }, 
              child: const Text('Incremnt as transaction')
            ),
            ListTile(
              title: const Text('Anchor to bottom'),
              leading: Checkbox(onChanged: (bool? value){
                if (value !=null) {
                  setState(() {
                    _anchorToBottom = value;
                  });
                }
              },
              value: _anchorToBottom,
              ),
            ),
            Flexible(
              child: FirebaseAnimatedList(
                key: ValueKey<bool>(_anchorToBottom),
                query: _messagesRef,
                reverse: _anchorToBottom,
                itemBuilder: (BuildContext context, DataSnapshot snapstho, Animation<double> animation, int index){
                  return SizeTransition(
                    sizeFactor: animation,
                    child: ListTile(
                      trailing: IconButton(
                        onPressed: () => _deleteMessage(snapstho),
                        icon: const Icon(Icons.delete),
                      ),
                      title: Text('$index: ${snapstho.value.toString()}'),
                    ),
                  );
                }
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
