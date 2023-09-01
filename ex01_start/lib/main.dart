import 'package:flutter/material.dart';

//앱 시작부분
void main() {
  runApp(const MyApp());
}

//시작 클래스. 머티리얼 디자인 앱 생성
class MyApp extends StatelessWidget { //상태변화가 없는 클래스(stateless)
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true, //사용여부
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//시작 클래스가 표시되는 클래스. 카운터 앱 화면
class MyHomePage extends StatefulWidget { //상태가 변하는 클래스(stateful)
  const MyHomePage({super.key, required this.title});
final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//---------------------------------------------------------------------
// 코드를 가져올때 위는 버리고 이 밑에만 부분적으로 긁어오는게 좋다.

//위 MyHomePage클래스의 상태를 나타내는 State클래스
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //counter 변수를 1 증가시키고 화면을 다시 그리는 메서드
  void _incrementCounter() {
    setState(() { //화면을 다시그림(리로드)(constant는 다시불러오지 않음)
    //stateless는 내버려두고 StatefulWidget만 다시 그린다.
    _counter++;
    });
  }

  //화면에 UI를 그리는 메서드. 그려질 위젯을 반환
  @override
  Widget build(BuildContext context) { 
   return Scaffold( //머티리얼 디자인 기본 뼈대 위젯
      appBar: AppBar( //상단 앱 바
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
         child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text( //const 없으면 써달라고 징징댐
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //클릭시 인크리멘트카운터 메서드 실행
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add), //하단 +버튼
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
