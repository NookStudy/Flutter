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
      home: const MyHomePage(title: 'EX26 ListView1'),
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
      //1.명시적으로 Listview의 children으로 List를 념겨서 생성
      body: ListView(
        // children: [
        //   ListTile(
        //     //좌측 시작부분
        //     leading: const FlutterLogo(
        //       size: 50.0,
        //     ),
        //     //타일에 출력할 제목, 중앙을 담당
        //     title: Text('Balic #1'),
        //     //출력할 내용
        //     subtitle: Text('타이틀과서브타이틀로만 구성'),
        //     //오른쪽 끝
        //     trailing: Icon(Icons.more_vert),
        //     onTap: () {
        //       print('Basic #1');
        //     },
        //   ),
        //   const Divider(
        //     color: Colors.black,
        //     height: 5
        //     //indent: 10,   //구분선 앞위공간
        //     // endIndent: 10, // 구분선 뒤 공간
        //   )
        // ],


        /*
            조금 희미한 구분선 LIST
        */
          // children:  ListTile.divideTiles(
          //     context: context,
          //     tiles: [
          //       ListTile(
          //         title: Text('Horse'),
          //       ),
          //       ListTile(
          //         title: Text('Cow'),
          //       ),
          //       ListTile(
          //         title: Text('Camel'),
          //       ),
          //       ListTile(
          //         title: Text('Sheep'),
          //       ),
          //       ListTile(
          //         title: Text('Goat'),
          //       ),
          //     ]
          // ).toList(),
        



        // children : getMyList1(),

        children : getMyList2(),

      )
    );
  }

  List<Widget> getMyList1(){
    List<Widget> myList =[
      // ListTile(
      //   leading: const FlutterLogo(size: 50.0),
      //   title: const Text('basic #1'),
      //   subtitle: const Text('타이틀과 서브타이틀로만 구성'),
      //   trailing: const Icon(Icons.more_vert),
      //   onTap:(){
      //     print('Basic #1');
      //   }
      // ),
      // const Divider(
      //   color: Colors.black,
      //   height: 5,
      //   // indent: 10,
      //   // endIndent: 10,
      // )
      
    ];
    return myList;
  }



  //3. 메서드의 리턴값으로 sacffold의 body 구성
  List<Widget> getMyList2(){
      //이런 데이터가 있다 치고. 더미데이터
    List<Person> persons = [];
    for (int i=0; i<15;i++){
      persons.add(Person(i+21, '홍길동$i',true));
    }
    List<Widget> myList =[];
      for(int i=0; i<persons.length; i++){
        Widget wid = ListTile(
          leading: const FlutterLogo(
            size: 50.0,
          ),
          title: Text('Basic #$i'),
          subtitle: Text('${persons[i].name} - ${persons[i].age}'),
          trailing: const Icon(Icons.thumb_up),
          onTap: (){
            print('Basic #$i');
          },
        );
        myList.add(wid);
      }
    return myList;
  }
}


class Person {
  late String name;
  late int age;
  //thumb up이든 뭐든 나중에 써먹을 수 있다.
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);

}