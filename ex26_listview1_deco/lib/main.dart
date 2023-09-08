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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        //시각적인 밀도
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //ListTile 클릭시 리플 효과 색상 변경
        splashColor: Colors.red,
        //Listtile highlight
        highlightColor: Colors.black.withOpacity(0.5),
      ),
      home: const MyHomePage(title: 'EX26 Listview1 Deco'),
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

    var _checkboxValue = false;
    var _radioValue = 0;
    var _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: getMyList(),
      )
    );
  }

  List<Widget> getMyList(){
    List<Widget> myList = [
      Container(
        // width: double.infinity,    //부모크기에 맞추기
        height: 100,
        alignment: Alignment.center,

        color: Colors.amber[600],
        child: const Text('onTab이 없어서 클릭 안됨', style: TextStyle(fontSize:30 ),),
        
      ),

      ListTile(
        title: Text('Basic #1'),
        subtitle: Text('타이틀과 서브 타이틀로만 구성'),
        trailing: Icon(Icons.more_vert),
        onTap: (){
          print('Basic #1');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
        indent: 10,    //들여쓰기
        endIndent: 10, //끝 들이기
      ),
      ListTile(
        leading: FlutterLogo(size: 50,),
        title: Text('Basic #2'),
        trailing: Icon(Icons.autorenew),
        onTap: (){
          print('asic #2');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5
        // indent: 10,
        // endIndent: 10,
      ),
      ListTile(
        leading: Icon(Icons.account_box,size: 50.0,),
        title: Text('Basic #3'),
        subtitle: Text('기본형의 모든 요소 사용'),
        trailing: Icon(Icons.arrow_back_ios),
        onTap: (){
          print('Basic #3');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5
        // indent: 10,
        // endIndent: 10,
      ),
      ListTile(
        leading: Icon(Icons.account_box,size: 50.0,),
        title: Text('Basic #3 - isThreeLine: false'),
        subtitle: Text('내용이 길면 다음줄로 내용이 넘어간다. 그러나 공간이 확장된다.밑에꺼랑 비교하기위해서 얘도 길게길게 늘려써봐야 알 수 있을것같다. 개행 안되나?'),
        trailing: Icon(Icons.arrow_back_ios),
        onTap: (){
          print('Basic #3 - isThreeLine: false');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5
        // indent: 10,
        // endIndent: 10,
      ),
      ListTile(
        leading: Icon(Icons.account_box,size: 50.0,),
        title: Text('Basic #3 - isThreeLine: true'),
        //텍스트를 3줄로 표현한것
        isThreeLine: true,    //타이틀이 맨위로 고정됨(사진과함께) default는 false
        subtitle: Text('내용이 길면 다음줄로 내용이 넘어간다. 공간도 한줄늘어난다.계속늘어난걸 보고싶으니까 계속써본다 언제까지 이어질지 보자'),
        trailing: Icon(Icons.arrow_back_ios),
        onTap: (){
          print('Basic #3 - isThreeLine: true');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5
        // indent: 10,
        // endIndent: 10,
      ),
      CheckboxListTile(
        value: _checkboxValue, 
        title: Text('CheckBox ListTile'),
          //삼항 연산자
        secondary: _checkboxValue ? Icon(Icons.thumb_up) : Icon(Icons.thumb_up_alt_outlined),
        onChanged: (bool? value){
          setState(() {
            _checkboxValue = value!;
          });
          print('CheckBox ListTile');
        }
        ),
        Divider(
        color: Colors.black,
        height: 5
        // indent: 10,
        // endIndent: 10,
      ),
      RadioListTile(
        title: Text('Good'),
        groupValue: _radioValue,
        value: 1,
        selected: true,
        onChanged: (int? value){
          setState(() {
            _radioValue = value!;
          });
        },
      ),
      Divider(
        color: Colors.black,
        height: 5
        // indent: 10,
        // endIndent: 10,
      ),
      RadioListTile(
        title: Text('NOT GOOD'),
        groupValue: _radioValue,
        value: 2,
        onChanged: (int? value) {
          setState(() {
            _radioValue = value!;
          });
        },
      ),
      Divider(
        color: Colors.black,
        height: 5
        // indent: 10,
        // endIndent: 10,
      ),
      SwitchListTile(
        title:  Text('Switch ListTile'),
        subtitle: Text(_switchValue? 'on':'off'),
        value: _switchValue,
        onChanged: (bool value){
          setState(() {
            _switchValue = value;
          });
          print('Switch ListTile');
        },
        secondary: _switchValue ? Icon(Icons.lightbulb) : Icon(Icons.lightbulb_outline),
      ),

      //클릭시 리플 효과 표시 됨(Card -> ListTile)
      Card(
        color: Colors.amber[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black,width: 1),
          borderRadius: BorderRadius.circular(0),
      ),
      child: ListTile(
        // contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
        leading: Icon(Icons.account_box,size: 50.0,),
        title: Text('Card -> ListTile', style: TextStyle(fontSize: 18, color: Colors.blue),),
        subtitle: Text('클릭시 리플 효과 표시 됨'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
          print('fff');
        }),
      ),
      //================================================================

      //클릭시 리플 효과 표시 됨( Card -> InkWell)
      Card(
        color:  Colors.amber[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black,width: 1),
          borderRadius: BorderRadius.circular(0),
        ),
        child: InkWell(
          splashColor: Colors.blue,   //스플래쉬색을 하드코딩으로 지정
          onTap: (){
            print('ggg');
          },
            child: const Row(
              children: [
                SizedBox(width: 100,height: 150,child: Icon(Icons.account_box,size: 50.0,),),
                //차지해야하는 공간보다 더 공간을 차지하고 싶으면 flexible로 감싼다.
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "location",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Population: 22 / 06/ 2020',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.data_usage),
                            )
                        ],
                      )
                    ],
                  )
                ),
              ],
            )
          ),
        ),
    ];
    return myList;
  }
}
