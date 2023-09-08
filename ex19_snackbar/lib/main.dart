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
      home: const MyHomePage(title: 'EX19 SnackBar'),
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
String msg = "Hello world";

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
            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  //Snackbar 구현한느 법 context는 위에 buildcontext에 있는
                  //객체를 그대로 가져오면 됨
                  SnackBar(
                    //snack bar의 내용. icon, button같은것도 가능하다.
                    content: Text(msg),
                    //스낵바가 닫히는 시간
                    duration: const Duration(milliseconds: 5000),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: (){},
                    ),
                  ),
                );
              }, child: const Text('SnackBar 기본', style: TextStyle(fontSize: 24),),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () => callSnackBar("안녕하세요~ 홍길동님!"), 
              child: Text('SnackBar 옵션',style: TextStyle(fontSize: 24),)
              ),
          ],
        ),
      ),
    );
  }

  callSnackBar(msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: const TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellow[800],
        duration: const Duration(milliseconds: 5000),
        action: SnackBarAction(
          label: 'Exit',
          textColor: Colors.black, 
          onPressed: () {},
        ),
        behavior: SnackBarBehavior.floating, //좀 떠있음
        // behavior: SnackBarBehavior.fixed,       //딱붙음. 기본
        shape: RoundedRectangleBorder(    //스낵바의 모양을 커스텀할수 있다.
            //모서리를 약간 둥글게 처리
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Colors.red,
            //테두리선 두께
            width: 10,
          )
        ),
      )
    );
  }
}
