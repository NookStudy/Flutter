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
      home: const MyHomePage(title: 'EX09 Expanded'),
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
  String _image1 = 'assets/images/900.png';
  String _image2 = 'assets/images/placeholder.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 5,  //HTML5의 %와 유사한 속서으로 웨젯의 비유을 설정, 비율 10기준
              child: Container(
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.all(0.0),
                color: Colors.cyan, //배경색
                alignment: Alignment.topLeft,
                child: Image.asset(
                  _image1,
                  alignment: Alignment.topLeft,
                  // alignment: Alignment.topCenter,
                  // alignment: Alignment.bottomRight,
                  // fit:BoxFit.none,   //원래크기대로 나옴. 프레임만 밖의 프레임으로
                  width: 390.0,
                  height: 250.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 0,top: 10,right: 0,bottom: 10),
              padding: const EdgeInsets.all(0.0),
              color: Colors.red,
              // width: 300,
              // height: 100,
              // alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => _onClick1(), 
                    icon: const Icon(Icons.upload_sharp),
                    tooltip: '이미지 위로 이동',
                    iconSize: 50.0,
                  ),
                  const SizedBox(width: 20,),
                  IconButton(
                    onPressed: () => _onClick2(),
                     icon: const Icon(Icons.download_sharp),
                     tooltip: '이미지 아래로 이동',
                     iconSize: 50.0,
                  )
                ]
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.all(0.0),
                color: Colors.cyan,
                alignment: Alignment.topLeft,
                child: Image.asset(
                  _image2,
                  alignment: Alignment.topLeft,
                  fit:BoxFit.none,
                  width: 390.0,
                  height: 250.0,
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  void _onClick1(){
    setState(() {
      /*
        상태변경을 위해 사용하는 메서드로 특정 변를 변경시키게 되면 
        화면의 랜더링이 다시 진행하면서 변경된 사진이 로드
      */
      _image1 = 'assets/images/900x600.png';
      _image2 = 'assets/images/placeholder.png';
    });
  }

  void _onClick2(){
    setState(() {
      _image1 = 'assets/images/placeholder.png';
      _image2 = 'assets/images/900x600.png';
    });
  }

}
