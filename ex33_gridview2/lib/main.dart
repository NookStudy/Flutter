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
      home: const MyHomePage(title: 'EX33 Gridview2'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(   //SizedBox로 사용하길 권장.   
              height: 300,
              child: GridView.count(
                // scrollDirection: Axis.vertical, //스크롤은 세로방향이 디폴트
                crossAxisCount: 3,          //타일갯수 자동계산
                childAspectRatio: 2,      //아이템의 가로세로 비율
                //int(50)의 길이만큼 0부터 index -1까지 범위의 각 인덱스를 
                //오름차순으로 호출하여 만든 값으로 리스트를 생성한다.
                children: List.generate(50, (index) {
                  return const Card(
                    color: Colors.blue,
                    child: Icon(Icons.face,color: Colors.yellow,size: 50,),
                  );
                }),
              ),
            ),
            Container(   
              color: Colors.black,   //color는 배경색을 지정하는데, 이게 없으면 그냥 sizedbox사용하기를 권장한다.
              height: 200,
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.horizontal,   //가로 스크롤 방향으로 설정
                children: List.generate(50, (index){
                  return const Card(
                    color: Colors.amber,
                  );
                }),
              ),
            )
          ],
        )
      )
    );
  }
}
