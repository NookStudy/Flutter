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
      home: const MyHomePage(title: 'EX14 Checkbox&Switch'),
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
  //체크박스와 스위치에서 사용할 전역변수(매개변수) 생성
  bool _chk1 = false;
  bool? _chk2 = false;    //Nullable
  bool _chk3 = false;
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
            //기본상태의 체크박스
            Checkbox(
              value: _chk1,     //체크박스에서 사용할 값 지정
              //체크 or 언체크시 이벤트 처리
              //위에서 bool을 ?처리 하지 않았으므로 여기서 bool? 을 사용
              onChanged: (bool? value){ //이벤트 체크
              //매개변수를 Nullable로 지정
                setState(() {   //변경후 UI 다시 그림
                  /*
                      null cehck operator
                      : 변수뒤에 !을 추가하면 run time시
                      null 에러를 띄워주고 실행시킴
                  */
                  _chk1 = value!;
                });
                print('Checkbox1 : $_chk1');
              }
            ),
            // Checkbox(
            //   value: _chk3, 
            //   onChanged: (value){
            //     _chk3 = value!;
            //   },
            // ),
            Checkbox(
              value: _chk2,
              // checkColor: Colors.pink, //체크되었을 때 마크의 색 
              activeColor: Colors.green, //체크되었을 때 배경색
              //노멀상태의 배경색은 테마로 변경
              onChanged: (bool?value){
                setState(() {
                  _chk2 = value;
                });
                print('Checkbox2 : $_chk2');
              }
            ),
            Switch(
              value: _chk3,
              activeColor: Colors.red,                      //스위치 온
              // activeTrackColor: Colors.cyan,               //스위치 온 배경색
              inactiveThumbColor: Colors.lightGreen,        //스위치 오프 색
              // inactiveTrackColor: Colors.lightGreenAccent, //스위치 오프 배경색
              //스위치에서 null값이 안나오므로 bool? 처리 안하면 ! 실행시에도 안함.
              onChanged: (value){
                setState(() {
                  _chk3=value;
                });
                print('Switch : $_chk3');
              }
            ),
          ],
        ),
      ),
    );
  }
}
