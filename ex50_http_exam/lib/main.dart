import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';      ///uft8.decode
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
      home: const MyHomePage(title: 'EX50 Http Exam'),
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
              onPressed: (){
                _getReqest();
              }, 
              child: const Text('Http(Get)',style: TextStyle(fontSize: 24),)
            ),
            ElevatedButton(
              onPressed: (){
                _postRequest();
              }, 
              child: const Text('Http(Post)',style: TextStyle(fontSize: 24),)
            ),
          ],
        ),
      ),
    );
  }

  void _getReqest() async{
    var url = Uri.parse('https://sample.bmaster.kro.kr/contacts/1694663638389');
    http.Response response =  //josn으로 가져와라
    await http.get(
      url, headers: {'Accept':"application/json"},
    );
    //접속상태 200이면 성공
    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    //요청레코드 정보 json
    var responseBody = utf8.decode(response.bodyBytes);

    print('statusCode: $statusCode');
    print('responseHeaders: $responseHeaders');
    print('responseBody: $responseBody');
  }

  void _postRequest() async{
    //여기로 보낸다.
    var url = Uri.parse('https://sample.bmaster.kro.kr/contacts');
    //데이터 입력하도록 요청
    http.Response response = await http.post(
      url,
      headers: {'Content-Type' : 'application/x-www-form-urlencoded'},
      body: {
        "name": "엘비스 프레즐리",
        "tel":"010-5678-4321",
        "address": "목포는 항구다",
        "photo":"http://sample.bmaster.kro.kr/photos/noimage.jpg"
      },
    );

    var statusCode = response.statusCode;
    var responseHeaders = response.headers;
    var responseBody = utf8.decode(response.bodyBytes); //for 한글

    print("statusCode: $statusCode");
    print("reponseHeaders: $responseHeaders");
    print("responseBody: $responseBody");
  }
}
