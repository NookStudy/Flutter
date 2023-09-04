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
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EX06 Image #2'),
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
      body: Column(
        //메인 방향으로 가운데 정렬하기
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,//컬럼의 메인이므로 수직방향의 센터(위아래방향)
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('fill: 사이즈 하나 지정'),
          Image.asset(
            'assets/images/900.png',
            fit:BoxFit.fill,        //사이즈만 지정하면 자동설정됨
            // alignment: Alignment.topLeft ,
            width: 70.0,           // 원래 사이즈가 비율대로 줄어듬
          ),
          const Text('cover: 사이즈 둘다 지정 자식이 넘쳐서 커버'),
          const SizedBox(height: 5,),
          Image.asset(
            'assets/images/900.png',
            fit: BoxFit.cover,      //큰 쪽에 맞춤. 작은 쪽 잘림
            alignment: Alignment.center,
            width: 100.0,
            height: 50.0,
          ),
          const Text('fill: 사이즈 둘다 지정. 자식의 distortion'),
          const SizedBox(height: 5,),
          Image.asset(
            'assets/images/900.png',
            fit:BoxFit.fill,    //사이즈에 맞춤. 이미지 형태에 변형 옴
            alignment:  Alignment.centerLeft,
            width:  150.0 ,
            height: 50.0,
          ),
          const Text('contain: 사이즈 둘다 지정. 작은쪽에 남겨서 들어감 '),
          const SizedBox(height: 5,),
          Image.asset(
            'assets/images/900.png',
            fit:BoxFit.contain,    //작은쪽에 맞춤. 큰쪽에 여백 남음
            alignment:  Alignment.topLeft,
            //사이즈를 둘다 주면 contain이 된다.
            width:  150.0 ,
            height: 100.0,
          ),
          const Text('미지정 : 사이즈 둘다지정. contain '),
          const SizedBox(height: 5,),
          Image.asset(
            'assets/images/900.png',
            // fit:BoxFit.contain,    
            alignment:  Alignment.topLeft, //큰쪽인 오른쪽에 여백남음
            width:  150.0 , //사이즈를 둘 다 주면 fill이 아니고 contain이 된다
            height: 100.0,
          ),
          const Text('none : 자식크기 그대로 두고 부모크기보여줌'),
          const SizedBox(height: 5,),
          Image.asset(
            'assets/images/900.png',
            fit:BoxFit.none,    //원래크기. 화면배율 영향 안 받음
            alignment:  Alignment.topLeft, //오른쪽 아래쪽 잘림
            width:  320.0 , 
            height: 50.0,
          ),
          
        ],//위젯 생략
      ),
    );
  }
}
