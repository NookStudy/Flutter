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
       
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 78, 246)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EX07 Buttons'),
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
      body: Center(             //바디를 센터(중앙)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  //위 아래의 중앙
          children: [
            ElevatedButton(
              child: const Text('Button #1',
                                style: TextStyle(fontSize: 24)),
               // ignore: avoid_print
               onPressed: (){
                print('첫 번재 버튼이 클릭됨');
               }
            ),
            ElevatedButton(
              child: const Text('Button #2',
                                style: TextStyle(fontSize: 24)),
               // ignore: avoid_print
               onPressed: (){
                _onClick();
               }
            ),
            ElevatedButton(
              child: const Text('Button #3',
                                style: TextStyle(fontSize: 24)),
               // ignore: avoid_print
               onPressed: () => _onClick()     //람다 형태로 함수 호출  
            ),
            ElevatedButton(
              onPressed: _onClick,            //함수명 대입
              child: const Text('Button #4',
                                style: TextStyle(fontSize: 24)),
               // ignore: avoid_print
            ),
          ],
        ),
      ),
    );
  }

  void _onClick(){
    print('버튼이 클릭됨');
  }


}

