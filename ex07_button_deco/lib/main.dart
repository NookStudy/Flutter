import 'package:flutter/cupertino.dart';
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
       
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 255, 136)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'EX 07 Button Deco'),
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
  String name = '클릭하세요!';

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text(
            '$name',  //문자열 표현식만 인ㅆ는 경우 $을 사용하지 마십시오
            //자동으로 지정되는 영문과 한글의 글자높이가 달라서 지정
            style: const TextStyle(fontSize: 30,height: 1.5)
          ),
          TextButton(
            onPressed: () {
                setState(() {
                name ='전우치';
              });
            }, 
            child: const Text('TextButton',
            style: TextStyle(fontSize: 24,
                            color: Colors.red),
                            ), 
            ),
          TextButton.icon(
            icon: const Icon(Icons.add_circle, size:  24.0,),
            label: const Text('TextButton + icon',
                style: TextStyle(
                  fontSize: 24,
                  color:  Colors.red 
                  ),
            ),
            style:  TextButton.styleFrom(
              foregroundColor : Colors.blue,
            ),
            onPressed: (){
              setState(() {
                name = '전우치';
              });
            }, 
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              textStyle: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
              shadowColor: Colors.red,
              elevation: 5,
              side:  const BorderSide(color: Colors.red,width: 1),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))
              )
            ),
            onPressed: (){
              setState(() {
                name = '전우치(back-color)';
              });
            }, 
            child: const Text('TextButton')),
          //ElevatedButton 과 TextButton사이의 (outline)강도를 가지는 위젯
          OutlinedButton(
            onPressed: (){
              _onClick1(1); //함수 호출
            }, 
            child: const Text('OutlineButton',
              style: TextStyle(
                fontSize: 24,
                color:  Colors.blue
              ),
              ),
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.web,size: 24.0,), 
            label:const Text('Outlinebutton',
              style: TextStyle(
                fontSize: 24,
                color: Colors.red
              ),
            ),
            onPressed: (){
              _onClick1(2);
            }
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              textStyle:
                const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,                  
              ),
              shadowColor: Colors.red,
              elevation: 5,
              side: const BorderSide(color: Colors.red, width: 1),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            onPressed: (){
              _onClick1(3);
            }, 
            child:  const Text('OutlineButton')
          ),
          ElevatedButton(
            child: const Text('ElevatedButton',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black38
              ),
            ),
            onPressed: () => _onClick1(4), //함수호출 
            ),
          ElevatedButton.icon(
            icon: const Icon(Icons.web, size: 24.0,),
            label: const Text('ElevateButton',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black38
              ),
            ),
            onPressed: () => _onClick1(5), //함수호출 
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              textStyle: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic),
                shadowColor: Colors.red,
                elevation: 5,
                side: const BorderSide(color: Colors.red, width: 1),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
              ),
            child: const Text('ElevatedButton'),
            onPressed: () => _onClick1(6), //함수호출 
            ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add_box),
                iconSize: 60.0,
                color :  Colors.blue,
                tooltip: "툴팁입니다.",
                onPressed: _onClick2, 
                ),
              IconButton(
                icon: Image.asset('assets/images/300x100.png',width: 100,),
                tooltip: "툴팁입니다.",
                onPressed: () => _onClick2(), 
                ),
                ElevatedButton(
                  onPressed:(){},
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ), 
                  child: const Text('The Flutter Way'),
                )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onClick3(),
        tooltip: '앱에서는 롱터치에 툴팁을 보여줍니다.',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onClick1(int kind){
    setState(() {
      switch(kind){
      case 1 : name = '홍길동'; break;
      case 2 : name = '홍길동(icon)'; break;
      case 3 : name = '홍길동(back-color)'; break;
      case 4 : name = '손오공'; break;
      case 5 : name = '손오공(icon)'; break;
      case 6 : name = '손오공(back-color)'; break;
      default :
      }
    });
  }

  void _onClick2(){
    setState(() {
      name = '해리포터' ;
    });
  }

  void _onClick3(){
    setState(() {
    name="클릭하세요!";
    });
  }

  

}


