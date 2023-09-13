import 'package:ex41_navigator3/page1.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

//Nook_ runtime null오류를 잡기위해 nullsafety를 써봤으나 개같이 실패!
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
      home: Page1( 
        data: '시작'
      )
    );
  }
}
