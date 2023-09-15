import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';
//dependencies에 버전 추가해줄것.
import 'package:path/path.dart';    
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
      home: const MyHomePage(title: 'EX57 SQLlite'),
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
  //sqlite 사용을 위한 데이터베이스 객체 생성
  late Future<Database> database;
  int seqNum = 0;
  //텍스트필드에 입력된 내용을 얻어오기 위한 컨트롤러
  final ctlMyText1 = TextEditingController();

  @override
  void initState(){
    super.initState();
    //앱이 최초 시작될 때 데이터베이스 생성
    createDatabase();
  }

  void createDatabase() async{
    database = openDatabase(
      //각 플랫폼 별로 데이터베이스 경로 생성
      //'path' 패키지의 'join'함수를 사용
      join(await getDatabasesPath(),'telbook.db'),
      //데이터가 처음 생성될 때, 테이블 생성.
      onCreate: (db, version){
        return db.execute(
          "create table telbook("
          " id Integer primary key, name Text, telnum text)",
        );
      },
      //oncreate 함수에 DB업그레이드와 다운그레이드를 위한 경로 제공
      version:  1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => doInsert(),
              child: const Text('Insert',style: TextStyle(fontSize: 24),),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () => doSelectAll(),
              child: const Text('Select All',style: TextStyle(fontSize: 24),),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: 240,
              child: TextField(controller: ctlMyText1 , keyboardType: TextInputType.number,),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                //클릭시 텍스트 필드에 입력된 내용(일련번호:id)를 얻어온다.
                var sNum = ctlMyText1.text;
                //얻어온 내용을 int로 변환
                int nNum = int.parse(sNum);
                doSelectOne(nNum);
              }, 
              child: const Text('Selecto One', style: TextStyle(fontSize: 24),)
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                var sNum = ctlMyText1.text;
                int nNum = int.parse(sNum);
                doUpdate(nNum);
              }, 
              child: const Text('Update', style: TextStyle(fontSize: 24),)
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                var sNum = ctlMyText1.text;
                int nNum = int.parse(sNum);
                doDelete(nNum);
              }, 
              child: const Text('Delete', style: TextStyle(fontSize: 24),)
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){
                doDeleteAll();
              }, 
              child: const Text('DeleteAll', style: TextStyle(fontSize: 24),)
            ),
          ],
        ),
      ),
    );
  }
  //전체 레코드 조회
  void doSelectAll() async{
    //데이터베이스 reference를 얻기
    final Database db = await database;
    //결괄는 list로 반환
    List<Map> datas = await db.rawQuery('select * from telbook');

    /**
     * 컬렉션에 어떤것이 포함되어 있는지 확인하기 위해 length를 호출하는 것은 느릴수 있음.
     * 대신 빠른게터가 있는데...
     * isEmpty 및 isNotEmpty. 결과를 부정할 필요가 없는 것을 사용해라
     */
    // if (datas.length>0) {
    if (datas.isNotEmpty) {
      for (var i = 0; i < datas.length; i++) {
        //각 레코드는 인덱스 i를 가지고 컬럼명을 가져온다.
        int id = datas[i]['id'];
        String name = datas[i]['name'] ;
        String telnum = datas[i]['telnum'] ;

        print('$id $name $telnum');
      }
    }else if(datas.isEmpty){
    // }else{
      //엠티면 없습니다.
      print('SelectAll : 데이터가 없습니다.');
    }
  }

  void doSelectOne(int num) async{
    //데이터베이스 reference를 얻기
    final Database db = await database;

    List<Map> data = await db.rawQuery('select * from telbook where id = $num');
    //print(data);
    if (data.length>0) {
      int id = data[0]['id'];
      String name = data[0]['name'] ;
      String telnum = data[0]['telnum'] ;

      print('$id $name $telnum');
    }else{
      print('Selectone : 데이터가 없습니다.');
    }
  }
  //새로운 레코드입력
  Future<void> doInsert() async{
    final Database db = await database;
    var telnum = '010-1234-0000';
    seqNum = seqNum +1;
    if (seqNum <10) {
      telnum = '010-1234-$seqNum$seqNum$seqNum$seqNum';
    }
    if (seqNum >=10) {
      telnum = '010-1234-$seqNum$seqNum';
    }
    if (seqNum>=100) {
      telnum = '010-1234-1$seqNum';
    }
    if (seqNum>=1000) {
      telnum = '010-1234-1$seqNum';
    }

    int count = await db.rawInsert(
      'insert into telbook (id,name, telnum) values (?,?,?)',
      [seqNum, '홍길동$seqNum',telnum]
    );
    print('Insert : $count');
  }

  Future<void> doUpdate(int id) async{
    final db = await database;

    int count = await db.rawUpdate(
      'update telbook set name =?, telnum=? where id = ?',
      ['손오공','010-1234-xxxx',id]
    );
    print('Update : $count');
  }

  Future<void> doDelete(int id) async{
    final db = await database;

    int count = await db.rawDelete(
      'delete from telbook where id = ?',[id]
    );
    print('Delete : $count');
  }

  Future<void> doDeleteAll() async{
    final db = await database;
    int count = await db.rawDelete('delete from telbook');
    print('DelteAll : $count');
    seqNum =0;
  }
}
