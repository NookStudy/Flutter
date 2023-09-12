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
      home: const MyHomePage(title: 'EX35 PageVie1w'),
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

  final _pageController = PageController(
    initialPage: 0
  );

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
              '터치한 후 좌우로 Swipe 하세요.',style: TextStyle(fontSize: 24),
            ),
            Expanded(
              flex: 1,
              child: PageView(
                controller: _pageController,
                // pageSnapping: false,    //페이지 넘김 보정 끄기    //기본 켜짐
                children: [
                  page1(),
                  page2(),
                  page3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget page1(){
    return const SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt,color: Colors.red, size: 50.0,),
            Text('Page Index : 0',style: TextStyle(fontSize: 20),)
          ],
        )
      ),
    );
  }
  Widget page2(){
    return const SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle,color: Colors.orange, size: 50.0,),
            Text('Page Index : 1',style: TextStyle(fontSize: 20),)
          ],
        )
      ),
    );
  }
  Widget page3(){
    return const SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications,color: Colors.blue, size: 50.0,),
            Text('Page Index : 2',style: TextStyle(fontSize: 20),)
          ],
        )
      ),
    );
  }
}
