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
      home: const MyHomePage(title: 'EX13 TextField #2'),
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
          // mainAxisAlignment: MainAxisAlignment.center, //어차피 expanded라서 의미가 읎다. 생략.
          children: <Widget>[
            const Text(
              '내용을 입력하세요',
              style: TextStyle(
                fontSize: 30.0
              ),
            ),
            /*
              텍스트 필드를 멀티라인으로 사용하는 경우 화면사이즈를 넘어가면 제대로 표현되지 않으므로 
              이 때는 Expanded위젯으로 감싸준다. 이 때 ctrl+. 을 사용하면 된다.
              (지울 때도 마찬가지)
            */
            Expanded(
              child: TextField(
                //maxLength를 추가하면 자동적으로 아래에 counter가 생성된다.
                maxLength: 1000,
                maxLines: 30,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,width: 1.0
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red,width: 1.0),
                  ),
                  labelText: '내용 입력',
                  // counterText: '',  //maxLength를 감춘다.(주석풀면 카운터 사라짐)
                  counterStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.red,
                  ),
                ),
                onChanged: (text){
                  print(text);
                },
                onSubmitted: (text){
                  print('Submitted : $text');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => _onClick(),
             child: const Text(
              '키보드 내리기',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black54,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onClick(){
    FocusScope.of(context).unfocus();
  }
}
