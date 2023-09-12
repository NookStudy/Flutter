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
      home: const MyHomePage(title: 'EX37 BottomNavigationBar'),
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

  int _curIndex =0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: getPage(),
        ),
        bottomNavigationBar: BottomNavigationBar(       //아이콘과 텍스트 설정
          backgroundColor: Colors.lightBlue[800],     //배경색
          iconSize: 30,                                 //아이콘 크기
          selectedItemColor: Colors.black,            //선택시 색
          selectedLabelStyle: const TextStyle(fontSize: 14),
          unselectedItemColor: Colors.white,          //비선택시 색
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          currentIndex: _curIndex,
          onTap: (index){
            setState(() {
              //콜백된 인덱스를 통해 전역변수의 값 변경
              _curIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            )
          ],
        ),
      );
  }

  //각 페이지를 인덱스를 통해 반환한다.
  Widget getPage(){
    //null 체크를 해줬으므로
    Widget? page; //null safety 적용
    switch (_curIndex) {
      case 0:
        page = page1();
        break;
      case 1:
        page = page2();
        break;
      case 2:
        page = page3();
        break;
        
    }
    //리턴하기전에 null체크 필수  (실행시 Null이면 런타임 에러 발생)
    return page!;
  }

  Widget page1(){
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.camera_alt, color: Colors.red,size: 50,),
            Text('Page index : 0', style: TextStyle(fontSize: 20),)
          ],
        )
      ),
    );
  }

  Widget page2(){
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_circle, color: Colors.orange,size: 50,),
            Text('Page index : 1', style: TextStyle(fontSize: 20),)
          ],
        )
      ),
    );
  }

  Widget page3(){
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.notifications, color: Colors.blue,size: 50,),
            Text('Page index : 2', style: TextStyle(fontSize: 20),)
          ],
        )
      ),
    );
  }

}
