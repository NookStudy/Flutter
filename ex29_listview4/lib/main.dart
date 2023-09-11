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
      home: const MyHomePage(title: 'EX29 listview4'),
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
      body: ListView.separated(
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index){
          return PersonTile(persons[index], index);
        }, 
        separatorBuilder: (BuildContext context, int index){
          return const Divider(
            // color: Colors.black,
            color: Colors.transparent,
            height: 1,    //없으면 간격 너무 벌어짐
            // thickness: 1.0,
          );
        }, 
        )
    );
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
        side: const BorderSide(color:  Colors.black, width: 1),
        borderRadius: BorderRadius.circular(0)
      ),
      child:InkWell(      //잉크웰 효과적용
        splashColor: Colors.blue,   //클릭시 변환색
        onTap: (){
          print('$index번 타일 클릭됨');
        },
        child: Row(// row로 한번
          children: [
              //row 1번 컬럼 좌측 아이콘
              const SizedBox(
                width: 100, height: 150,
                child: Icon(Icons.account_box,size: 50.0,),
              ),
              //row 2번 컬럼 오른쪽 텍스트 부분
              Expanded(
                //row 2번 컬럼을 다시 위아래로 양분
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //2번row 1번컬럼
                    Text(
                      _person.name,
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    //2번row 2번컬럼
                    Text(
                      "'${_person.age}세'",
                      style: const TextStyle(fontSize: 14.0,fontWeight: FontWeight.normal),
                    ),
                    //2번 row 3컬럼 가로로 쪼개기
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //2번 row 3번컬럼의 1번 row
                        Text('$index번 타일', style: const TextStyle(fontSize: 12.0,fontWeight: FontWeight.normal),),
                        //2번 row 3번컬럼의 2번 row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            child: const Text(
                              'ElevatedButton',
                              style: TextStyle(fontSize: 24),
                              ),
                            onPressed: () => _onClick(index),
                          ),
                        )
                      ],
                    )
                  ],
                )
              )
            ],
        ),
      )
    );
  }
  void _onClick(int index){
    print('$index 클릭됨');
  }
}
