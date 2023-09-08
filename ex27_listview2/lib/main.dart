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

  late List<Person> persons;

  @override
  void initState(){
    super.initState();

    persons = [];
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
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index){
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

class PersonTile extends StatelessWidget{
  final Person _person;

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