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
      home: const MyHomePage(title: 'EX08 Container'),
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
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          //상단부터 위젯을 배치
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //컨테이너를 박음으로써 Text의 backgroudcolor를 입힐 수 있다.
            Container(
              //4방향으로 마진이나 패딩을 적용한다.
              // margin:  const EdgeInsets.all(10.0),
              //지정한 방향에만 적용한다.
              margin: const EdgeInsets.only(left: 10, top: 10),
              padding: const EdgeInsets.all(0.0),
              color:  Colors.yellow , //지정하지 않으면 컨테이너의 크기를 알 수 없다.
              // width: 300,  //크기를 지정하지 않거나 초과하면 부모(디스플레이)의 크기 => 가로화면을 넘어가기는 좀 그렇고
              height: 100,    //크기를 지정하지 않으면 자식(컨테이너)의 크기  => 어차피 내리면 그만이니까
              //결론 : 가로는 디스플레이가, 세로는 컨테이너가 기본이다.

              //안의 컨텐츠를 위왼쪽에 적용시킴
              alignment: Alignment.topLeft,
              child: const Text(
                '홍길동',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              margin:  const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(80.0), //자식과의 패딩으로 크기가 정해짐
              alignment: Alignment.center,
              //컨테이너의 모양을 결정하는 속성
              decoration: const BoxDecoration(
                //박스 모양을 원으로 결정한다.
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Text(
                '전우치',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin:  const EdgeInsets.all(0.00),
              padding: const EdgeInsets.all(20.0), //자식과의 패딩으로 크기가
              width: 400,
              height: 100,
              //안의 컨텐츠를 오른쪽밑에 위치시킴
              alignment: Alignment.bottomRight,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.brown,
              ),
              child: const Text(
                '손오공',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
           const SizedBox(height: 5,),

           Container(
            //버튼형식이 아니고 그냥 컨테이너만들어서 이미지박음.
            width: 100.0,
            height: 60.0,
            //라운드 형태로도 만들 수 있음. 모양을 바꿀 수 있음
            decoration: const BoxDecoration(  //상태창 꾸미기
              image:  DecorationImage(  
                image: AssetImage('assets/images/300x100.png')
              ),
            ),
            //텍스트 버튼으로 마치 이미지 버튼과 같은 효과를 적용한다.
            child: TextButton(
              child: const Text('',),
              onPressed: () => _onClick(1),
            ),
           ),

          Ink.image(
            //바로 Ink로 이미지박음(좀더 자연스러움)
            //이미지로 버튼을 만들어야 할 때 쓴다.
            image: const AssetImage('assets/images/300x100.png'),
            width: 100.0,
            height: 40.0,
            // fit: BoxFit.fill,
            //해당 위젯은 onTap으로 클릭설정을 한다.
            child: InkWell(
              child: const Text(''),
              onTap: () => _onClick(2),
            ),
            ),
           Container(
            //  padding: const EdgeInsets.all(10.0),
             margin: const EdgeInsets.all(10.0),
             child: Ink.image(
              //컨테이너 안에 박으면...?
              image: const AssetImage('assets/images/300x100.png'),
              width: 100.0,
              height: 40.0,
              // fit: BoxFit.fill,
              child: InkWell(
                child: const Text(''),
                onTap: () => _onClick(2),
              ),
              ),
           ),
            

          ],
        ),
      ),
    );
  }

  void _onClick(int num){
    print('Hello~ $num');
  }
}
