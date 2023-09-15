import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xml2json/xml2json.dart';
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
      home: const MyHomePage(title: 'EX '),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text(
                'Json Parsing',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: (){
                getJsonData();
              },
            ),
            ElevatedButton(
              child: Text(
                'XML Parsing',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: (){
                getXMLData();
              },
            ),
          ],
        ),
      ),
    );
  }

  void getJsonData(){
    //안쪽 데이터는 더블쿼네이션으로 해야 에러가 안난다.
    String json = '''
{"items":
          {"item":
            [
              {"id" : "1", "name":"홍길동"}
              {"id" : "2", "name":"전우치"}
              {"id" : "3", "name":"손오공"}
            ]
          }
}
''';

    var data1 = jsonDecode(json);
    print(data1);

    List data2 = data1['items']['item'];
    print(data2);

    print('================================================');
    for (var item in data2) {
      print(item['name']);
    }
  }

  //xml2json: ^4.3.0 depencies 추가
  void getXMLData(){
    String xmlData = '''
    <items>
      <item>
        <id>1</id>
        <name>홍길동</name>
      </item>
      <item>
        <id>2</id>
        <name>전우치</name>
      </item>
      <item>
        <id>3</id>
        <name>손오공</name>
      </item>

    </items>
''';
    Xml2Json xml2json = Xml2Json();
    xml2json.parse(xmlData);
    var json = xml2json.toParker();     //the only mehod that worked for my XML
    print(json);    //<--String

    var data1 = jsonDecode(json);
    print(data1);   //Json Object

    List data2 = data1['items'] ['item'];
    print(data2);

    print('======================================================');
    for (var i = 0; i < data2.length; i++) {
      print(data2[i]['id']);
    }
    print('======================================================');
    for (var item in data2) {
      print(item['name']);
    }
  }
}
