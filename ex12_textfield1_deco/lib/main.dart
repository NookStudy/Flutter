import 'dart:ffi';

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
      home: const MyHomePage(title: 'EX12 TextField #01 Deco'),
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
  //전역변수(멤버변수)를 private로 선언
  //앞에 _(언더바)가 있으면 private
  int _count =0;
  String _myText = 'TextField 사용 예제입니다.';
  final ctlMyText1 = TextEditingController();
  final ctlMyText2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(      //세로형 배치
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //텍스트위젯 : 텍스트 출력
            Text(
              _myText,
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(height: 20,),    //간단한 간격 조정
            TextField(    //입력값이 없는 텍스트 필드
              controller: ctlMyText1,
            ),
            const SizedBox(height: 20,), //간격조정
            //입력된 텍스트의 길이를 출력하는 용도(개발자가 정의)
            Text(
              '$_count/20',
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(       //텍스트필드의 너비를 SizedBox를 통해 지정
              width: 240,
              child: TextField( 
                controller: ctlMyText2,
                cursorColor: Colors.red,  //커서의 컬러지정 
                cursorWidth: 4.0,           //두께지정
                //maxLength를 추가하면 자동적으로 아래에 counter가 생김
                maxLength: 10,              //입력할 문자열의 최대길이
                obscureText: true,          //입력문자 숨김 옵션(눈모양)
                enabled: true,             //비활성화(수정시 쓸모있을듯)
                //keyboardType: TextInputType.emailAddress,
                keyboardType: TextInputType.number,
                // keyboardType: TextInputType.phone,
                // keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  // border: InputBorder.none,
                  // border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(      //focus시 색
                    borderSide: BorderSide(color: Colors.greenAccent,width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(      //활성화 색
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  disabledBorder: OutlineInputBorder(     //비활성화 색
                    borderSide: BorderSide(color: Colors.grey, width: 1.0)
                  ),
                  prefixIcon: Icon(Icons.perm_identity),
                  // prefixText: 'PW'
                  labelText: 'Password',    //힌트
                  helperText: '비밀번호를 입력하세요',   //박스아래쪽 안내문구
                  counterText: '',//maxLength를 감춘다.  //주석을 풀면 카운터가 없어짐
                  counterStyle: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                  ),
                ),
                //입력값이 변할때마다 이벤트가 발생함
                onChanged: (text){
                  //해당 메서드에서 변수가 변화하면 화면이 재랜더링 된다.
                  setState(() {
                    _count=text.length;
                  });
                  print(('$text-$_count'));
                },
                onSubmitted: (text){
                  print('Submitted : $text');
                },
              ),
            ),
            OutlinedButton(
              onPressed: (){
              setState(() {
                _myText = ctlMyText1.text;
              });
            },
            child: 
              const Text('text 입력버튼',
              style: TextStyle(fontSize: 24)
              ),
            ),
          ],
        ),
      ),
      //password를 위에서 띄워줌
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _myText = ctlMyText2.text;
          });
        },
        tooltip: 'TextField Submit',
        child: const Icon(Icons.send),
        ),
    );
  }
}
