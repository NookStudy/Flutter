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
      home: const MyHomePage(title: 'EX34 Gridview3'),
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
  late List<Person> persons;

  @override
  void initState(){
    super.initState();

    persons = [];
    //데이터로 사용하기 위한 반복
    for (var i = 0; i < 15; i++) {
      persons.add(Person(i+21, '홍길동$i',true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        // width: double.infinity,
        // height: 400.0,   //주석처리하면 자식크기로 설정
        child: GridView.count(
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 3,        //자동으로 크기가 계산된다
          childAspectRatio: 0.7,    //가로세로 비율
        children: getGridPage(),
        ),
      )
    );
  }

  List<Widget> getGridPage(){
    //그리드로 사용할 리스트 생성
    List<Widget> grid= [];
    for (var i = 0; i < persons.length; i++) {
      Widget myWidget = Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(1),
        color: Colors.blue,
        child: PersonTile(persons[i],i),
      );
      grid.add(myWidget);
    }
    return grid;
  }
}

class Person{
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);
}

class PersonTile extends StatelessWidget{
  final Person _person;
  final int index;    //타일에 추가 데이터가 필요한 경우 생성자에 추가하면 된다.

  const PersonTile(this._person,this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    /*
      리스트 타일에 배경색을 부여하고 싶을 때는 Container로 감싼 후 (Ctrl + .)
      color : 로 배경색을 입힌다.
    */
    //리스트 카드대신 카드를 사용한다.
    return Card(   //교안에서 추가한 부분
      color: Colors.amber[100], //배경색
      elevation: 0,   //카드의 테두리 속성
      shape: RoundedRectangleBorder(
        side: const BorderSide(color:  Colors.black, width: 0.2),
        borderRadius: BorderRadius.circular(0)
      ),
      child:InkWell(      //잉크웰 효과적용
        splashColor: Colors.blue,   //클릭시 변환색
        onTap: (){
          print('$index번 타일 클릭됨');
        },
        child: SizedBox(
          width: 140,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity
                ,
                height: 100,
                alignment: Alignment.center,
                color: Colors.blue[50],
                child: Column(
                  children: [
                    Text(
                      _person.name,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    Text("'${_person.age}세'",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _onClick(index), 
                child: Text('Button', style: TextStyle(fontSize: 13),)
              ),
            ]
          ),
        ),
      )
    );
  }
  void _onClick(int index){
    print('$index 클릭됨');
  }
}