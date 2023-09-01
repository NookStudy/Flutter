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
      home: const MyHomePage(title: 'EX03 Test'),
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

  @override
  Widget build(BuildContext context) {
    //withOpacity() 메서드는 const 상수로 사용할 수 없다.
    var myTextStyle1 = TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: Colors.red.withOpacity(0.8),
                        );
  
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    //   body:Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: <Widget>[
    //         Text(
    //           '홍길동',
    //           style: TextStyle(
    //            fontSize: 30,
    //           ),
    //         ),
    //         Text(
    //           '전우치',
    //           style: TextStyle(
    //            fontSize: 30,
    //           ),
    //         ),
    //       ],
    //     ),
    //   )
    // );
      //위젯의 배치를 수직 방향으로 설정한다.
      //가로로 설정 할때는 Row를 사용한다.
      body: Column(
        //위젯을 2개이상 배치하기 위해  사용하는 속성
        //주로 배열형태로 기술('['대괄호를 써서 Text를 배열로 나열함)
        children: <Widget>[
          
          /**
           * 텍스트를 표현하기 위한 위젯
           * Text(출력내용, 스타일)
           */
          //Text를 선택한 후 ctrl + . 을 누르면 메뉴가 나옴 그중에 컬럼을 선택해서 추가할 것.
          // center는 똑같이 선택한 후 remove로 지울것
            const Text(
              '0123456789Aa가#',
              style: TextStyle(
                fontSize: 30.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontFamily: "D2Coding",
                letterSpacing: 4.0,
              ),
            ),
          const Text(
            '0123456789Aa가#',
            style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500, //굵기 Medium  => 미리 정해진 상수값 사용
              color: Color(0xFF000000),
            ),
          ),
          Text(
            '0123456789Aa가#',
            style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.5), //글자색 black 투명도 0.5
            ),
          ),
              Text(
                '0123456789Aa가#',
                textAlign: TextAlign.left,
                style: myTextStyle1,
                ),
        ],
      ),
    );
  }
}
