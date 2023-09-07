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
      home: const MyHomePage(title: 'EX15 Radio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//enum은 클래스 내부에 선언할 수 없고, 상수는 소문자로...(자바와 다름)
enum Fruit {apple,banana}

class _MyHomePageState extends State<MyHomePage> {
  Fruit _myGroup1 = Fruit.apple;  //첫 번째 그룹 구분에 사용할 변수
  Fruit _myGroup2 = Fruit.banana; //두 번째 그룹 구분에 사용할 변수

  bool _btn = true;   //버튼의 활성화 / 비활성화를 위한 변수


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
            //라디오 버튼을 정확히 클릭해야만 선택됨
            ListTile(
              title: const Text('사과'),
              leading: Radio<Fruit>(
                groupValue: _myGroup1,
                value: Fruit.apple,
                /*
                  Flutter2.0에서 적용되면서 Null safety가 적용되어
                  널 체크 부분이 강화되었다.
                */
                onChanged: (Fruit? value){
                  setState(() {
                    //널 체크를 해야 한다.
                    _myGroup1 = value!;
                    print(_myGroup1);
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('바나나'),
              leading: Radio<Fruit>(
                //라디오를 하나의 그룹으로 만들 때 사용하는 속성(같은이름을 가진 그룹으로 묶인다.)
                groupValue: _myGroup1,
                //해당 라디오의 값으로 설정할 value
                value: Fruit.banana,
                //라디오 클릭시 이벤트 리스너
                onChanged: (value){
                  setState(() {
                    // 변수 뒤에 ! - 변수 값에 null이 들어오면 런타입 에러발생시킴
                    _myGroup1 = value!;
                    print(_myGroup1);
                  });
                },
              ),
            ),
            //라디오 버튼의 영역이 넓어지므로 해당 라인을 클릭하면 된다.
            RadioListTile<Fruit>(
              title: const Text('사과'),
              value: Fruit.apple, 
              groupValue: _myGroup2, 
              onChanged: (value){
                setState(() {
                  _myGroup2=value!;
                  print(_myGroup2);
                  //아래 엘리베이트버튼을 활성화/비활성화시키는 기능이 추가됨.
                  _btn = true;
                });
              }
            ),
            RadioListTile<Fruit>(
              title: const Text('바나나'),
              value: Fruit.banana, 
              groupValue: _myGroup2, 
              activeColor: Colors.pink,
              //노멀 상태의 배경색은 테마로 변경 : unselectedWidgetColor
              onChanged: (value){
                setState(() {
                  _myGroup2=value!;
                  print(_myGroup2);
                  _btn = false;
                });
              }
            ),
            const SizedBox(height: 50 ,), //간단한 간격조정
            ElevatedButton(
              //_btn이 true면 onClick1, false면 null
              //버튼의 onPressed 매개변수를 null로 설정하면 버튼이 비활성화됨
              onPressed: _btn ? _onClick1 : null,
              child: const Text('ElevatedButton',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),), //함수호출
            ),
          ],
        ),
      ),
    );
  }
  void _onClick1(){
    print("Radio 2 : $_myGroup2");
  }
}
