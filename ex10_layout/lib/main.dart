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
      home: const MyHomePage(title: 'EX10 LAYOUT'),
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
      /*
        위젯을 감쌀필요가 있는 경우 ctrl + . 을 사용한다.
      */
      body: SafeArea(
        child: Container(
          color: Colors.orange,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.yellow,  //컬러 넣을일없으면 컨테이너 안써도 된다.
                  width: 280,
                  height: 100,
                  
                  child: Row(     //가로형 배치
                    mainAxisAlignment: MainAxisAlignment.center,  //가로의 중앙배치
                    mainAxisSize: MainAxisSize.max,
                    // children : 2개 이상의 위젯을 배치할 때 사용
                    // child : 1개의 위젯을 배치할 때 사용
                    children: [
                      ElevatedButton(
                        child: const Text('button') ,onPressed: (){},
                      ),
                      // SizedBox(width: 10,),  //위젯 사이의 간격조정
                      // const Spacer(flex: 1,), //위젯의 전체적인 배치 조절. 상대
                      ElevatedButton(
                        child: const Text('button') ,onPressed: (){},
                      ),
                      // const Spacer(flex: 1,),
                      // SizedBox(width: 10,),
                      ElevatedButton(
                        child: const Text('button') ,onPressed: (){},
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.cyan,  //컬러 넣을일없으면 컨테이너 안써도 된다.
                  width: 280,
                  height: 100,
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //수직 방향에서 아래쪽 정렬
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        child: const Text('button') ,onPressed: (){},
                      ),
                      // SizedBox(width: 10,),
                      // const Spacer(flex: 1,),
                      ElevatedButton(
                        child: const Text('button') ,onPressed: (){},
                      ),
                      // const Spacer(flex: 1,),
                      // SizedBox(width: 10,),
                      ElevatedButton(
                        child: const Text('button') ,onPressed: (){},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
