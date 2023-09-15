import 'package:flutter/material.dart';
import 'package:open_api_xml_parser/src/home.dart';
import 'package:open_api_xml_parser/src/provider/ev_provider.dart';
import 'package:provider/provider.dart';
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
      //MultiProvider를 통해 여러가지 provider를 관리
      home: MultiProvider(
        //ChangeNotifierProvider 통해 변호아ㅔ 대해 구독
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => EvProvider())
          ],
          child: const Home(),
        ),
    );
  }
}