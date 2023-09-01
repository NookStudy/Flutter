import 'package:flutter/material.dart';

void main() {
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
      home: const MyHomePage(title: 'Ex02 Stateful'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

//변화가 있는 필요한 부분만 변화를 시키는
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String name ='홍길동';

  void _incrementCounter() {
    setState(() {   //상태가 있는 애들을 다시 set해라. 한개라도 변하면
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(     //중앙
        child: Column(  //수직형
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(   //전체가 상수이므로 상태가 변경되지 않는 텍스트를 표현
              'You have pushed the button this many times:',
            ),
            Text(
              // '$_counter',
              '이름: $name',    //옵션이 있어서 변할수 있다라는 표현
              style: Theme.of(context).textTheme.headlineMedium,
              //테마가 변화면 여기도 변하기 때문에 여기는 상수 처리 안함.
              //style이기 때문이 아님
            ),
            Text(
              '홍길동', //'옵션이 있어서 변할 수 있다' 라는 표현
                style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

