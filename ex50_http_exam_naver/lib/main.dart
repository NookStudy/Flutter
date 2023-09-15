import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  //utf8.decode

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
      home: const MyHomePage(title: 'EX50 http Exam Naver'),
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
  var text = '';

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
            Text(
              '검색어를 입력하세요',
              style: TextStyle(fontSize: 30.0),
            ),
            TextField(
              maxLength: 10,
              maxLines: 2,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent,width: 1.0)
                ),
                //labelText: '내용입력'
                //counterText: '',
                counterStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                ),
              ),
              onChanged: (text1){
                text = text1;
                print('$text1');
              },
              onSubmitted: (text){
                print('Submitted: $text');
              },
            ),
            ElevatedButton(
              onPressed: (){
                _getReqeust();
              }, 
              child: const Text('Http (Get)',style: TextStyle(fontSize: 24),)
            )
          ],
        ),
      ),
    );
  }
  void _getReqeust() async{
    // var url = Uri.parse('https://example.com/whtsit/create');
    // var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

    String str = Uri.encodeQueryComponent(text);
    String url = 'https://openapi.naver.com/v1/search/news.json';
    String opt = '&display=50&sort=sim';

    var regUrl = Uri.parse("$url?query=$str$opt");
    print(regUrl);

    http.Response response = await http.get(
      regUrl,
      headers:{
        "X-Naver-Client-Id" : "N_OJ4R4ZvlvgDbbtnXWg",
        "X-Naver-Client-Secret" : "AgFvQnLi85"
      }
    );

    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);
    //$respnse.body
    print('StatusCode: $statusCode');
    print('reponseBody: $responseBody');

  }
}
///statusCode  : 200 => 성공
///404 => 경로 에러
///403 => 로그인 정보 에러
///401 => 인증에러
///500 => 에러(도메인 글러먹음)