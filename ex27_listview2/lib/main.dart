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
      home: const MyHomePage(title: 'EX27 ListView2'),
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
  //나중에 초기화 될 것임을 명시함. 데이터로 사용할 컬렉션
  late List<Person> persons;

  //위젯 초기화시 딱 한번만 호출되는 함수로 변경했을 때 Hot reload가
  //지원되지 않으므로 재시작해야 한다.
  @override
  void initState(){
    super.initState();

    persons = [];
    //데이터로 사용하기 위한 반복
    for (var i = 0; i < 15; i++) {
      persons.add(Person(i+21, '홍길동$i'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      //ListView.builder를 사용해서 Lazy 하게 생성
      //index를 이용하여 플러터가 알아서 필요한만큼 리스트를 생성한다.
      body: ListView.builder(
        padding: const EdgeInsets.all(8) ,
        //컬렉션에 저장된 아이템의 갯수만큼 알아서 반복
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index){
          //리스트뷰의 아이템을 갯수만큼 생성하여 반환
          return PersonTile(persons[index]);
        },
      )
    );
  }
}



class Person{
  late String name;
  late int age;
  Person(this.age,this.name);
}

//PersonTile 정의
/*
  StatelessWidget클래스는 build()메서드를 가지고 있다.
  build()메서드는 위젯을 생성할 때 호출되는데, 
  실제로 화면에 그릴 위젯을 작성해 반환한다.
  따라서 StatelsessWidget클래스를 상속받은 PersonTile클래스는
  ListTile클래스의 인스턴스를 작성해 반환한다.
*/

class PersonTile extends StatelessWidget{
  //멤버변수와 생성자 정의
  final Person _person;
  //필수 매개변수, {선택형 매개변수}
  PersonTile(this._person);

  @override 
  Widget build(BuildContext context){
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(_person.name),
      subtitle: Text('${_person.age}세'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap : (){
        print(_person.name);
      }
    );
  }
}