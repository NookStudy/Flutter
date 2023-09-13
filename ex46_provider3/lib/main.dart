import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyData extends ChangeNotifier{
  String name ='홍길동';
  int age = 25;

  void change(String name, int age){
    print('change called...');
    this.name = name;
    this.age = age;

    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyData>(
      create: (_)=> MyData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Page1(),
      ),
    );
  }
}


class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  late MyData myData;

  @override
  Widget build(BuildContext context) {

    myData = Provider.of<MyData>(context,listen: false);
    print("Page1 빌드됨...");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Page2()));
              }, 
              child: const Text('2페이지 추가',style: TextStyle(fontSize: 24),)
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent
              ),
              onPressed: (){
                myData.change('전우치', 30);
              },
              child: const Text('전우치로', style: TextStyle(fontSize: 24),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
              onPressed: (){
                myData.change('홍길동', 25);
              },
              child: const Text('홍길동으로',style: TextStyle(fontSize: 24),),
            ),
            const SizedBox(height: 50,),
            Text(
              '${myData.name}- ${myData.age}',
              style:  const TextStyle(fontSize: 30),
            ),
            Consumer<MyData>(
              builder: (context, myData,child){
                print('Consumer<MyData> 여기도 빌드됨');
                return Text('${myData.name}- ${myData.age}', style:  const TextStyle(fontSize: 30),);
              }
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late MyData myData;

  @override
  Widget build(BuildContext context) {

    myData = Provider.of<MyData>(context, listen: true);
    print("Page2 빌드됨...");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: (){
                Navigator.pop(context);
              },
              child:  const Text('2페이지 제거',style: TextStyle(fontSize: 24),),
            ),
            const SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
              onPressed: (){
                myData.change('홍길동2', 26);
              },
              child: const Text('홍길동으로',style: TextStyle(fontSize: 24),),
          ),
            Text(
              '${myData.name}- ${myData.age}',
              style:  const TextStyle(fontSize: 30),
          ),
            Consumer<MyData>(
              builder: (context, myData,child){
                print('Consumer<MyData> 여기도 빌드됨');
                return Text('${myData.name}- ${myData.age}', style:  const TextStyle(fontSize: 30),);
              }
            )
          ],
        ),
      ),
    );
  }
}