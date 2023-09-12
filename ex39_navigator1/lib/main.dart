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
      //개발자가 직접 정의한 Page1클래스를 사용함.
      home: Page1(),
    );
  }
}


//stful 단축키를 통해 자동완성
class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    print('Page1');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('2페이지 추가',style: TextStyle(fontSize: 24),),
              onPressed: (){
                //스텍에 페이지 추가
                Navigator.push( //push를 쓰면 페이지위에 새 페이지가 덮임
                  context, 
                  MaterialPageRoute(builder: (context)=> const Page2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}





class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    print('Page2');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(  //push를 쓰면 페이지위에 새 페이지가 덮임
                  context, 
                  MaterialPageRoute(builder: (context)=> const Page3()),
                );
              },
              child: const Text('3페이지 추가',style: TextStyle(fontSize: 24),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // primary: Colors.orange    //primary는 더이상 사용하지 않으므로
                backgroundColor: Colors.purple.shade100,    //backgroundColor를 쓴다
              ),
              onPressed: (){
                print('Page2-pop');
                Navigator.pop(context);       //pop을 쓰면 페이지가 스택에서 제거됨
              },
              child: const Text('2페이지 제거',style: TextStyle(fontSize: 24),),
            ),
          ],
        ),
      ),
    );
  }
}





class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    print('Page3');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade100, ),
              onPressed: (){
                print('Page3-pop');
                Navigator.pop(context);
              },
              child: const Text('3페이지 제거',style: TextStyle(fontSize: 24),),
            ),
          ],
        ),
      ),
    );
  }
}