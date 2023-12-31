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
      home: const MyHomePage(title: 'EX20 MaterialBanner'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                'Banner',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () {
                /*
                  snackBar와 다른점 : duration 옵션없다.
                  스낵바는 화면 위에 플로팅,
                  메터리얼배너는 출력시 다른 위젯을 밀어낸다.
                */
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: const Text('안녕하세요, 오른쪽 닫기를 누르세요!'),
                    //좌측 아이콘
                    leading: const Icon(Icons.info),
                    backgroundColor: Colors.yellow,
                    actions: [
                      TextButton(
                        onPressed: ()=>ScaffoldMessenger.of(context).hideCurrentMaterialBanner(), 
                        child: Text('닫기')
                      ),
                    ]
                  )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
