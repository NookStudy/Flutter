import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      home: const MyHomePage(title: 'EX47 SharedPreferences'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//스마트폰에서 앱을 완전 종료 후 다시 실행해야 함.
class _MyHomePageState extends State<MyHomePage> {
    //SharedPreferences 메서드로 객체에 저장할 데이터 생성
    late int counter;
    late SharedPreferences prefs;

    @override
    void initState(){
      super.initState();
      getSharedPreferences();
    }
    
    
    getSharedPreferences() async{
      //객체 생성
      prefs = await SharedPreferences.getInstance();
      setState(() {
        // 기존에 저장된 값이 없다면 0, 있다면 해당 값으로 변수값을 설정한다.
        counter = (prefs.getInt("counter") ?? 0);
      });
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
              child:FloatingActionButton(
                onPressed: (){
                  setState(() {
                    counter--;
                  });
                  //숫자 감소 후 객체에 값 저장
                  prefs.setInt("counter", counter);
                },
                child: Icon(Icons.remove),
                heroTag : "빼기",
              ),
            ),
            Text('Shared preferences value:'),
            Text(
              '$counter',
              // '${counter.toString()}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 40,
              child:FloatingActionButton(
                onPressed: (){
                  setState(() {
                    counter++;
                  });
                  prefs.setInt("counter", counter);
                },
                heroTag : "더하기",
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
