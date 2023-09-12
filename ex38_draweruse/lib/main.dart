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
      home: const MyHomePage(title: 'EX38 Drawuse'),
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

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //this to prevent the default slideing behaviour
      drawerEnableOpenDragGesture: true,
      key: scaffoldKey,
      appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: Builder(builder: (context)=>   //Ensure Scaffold is in context
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(), 
            icon: const Icon(Icons.menu),
          )
        ),
      ),
      // drawer메뉴를 위한 프로퍼티
      drawer: Drawer(
        //해당 메뉴는 리스트뷰를 통해 구성한다.
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',style: TextStyle(color: Colors.white,fontSize: 24),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Drawer Close'),
              onTap: ((){
                //Closing programmatically
                scaffoldKey.currentState!.openEndDrawer();
                // Scaffold.of(context).openEndDrawer(); //안됨
              }),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '왼쪽 끝에서 오른쪽으로 드래그해 봅니다.',
            ),
            ElevatedButton(
              onPressed: (){
                // Scaffold.of(context).openDrawer(); //안됨
                scaffoldKey.currentState!.openDrawer();
              }, child: const Text('Drawer 열기',style: TextStyle(fontSize: 24),),
            ),
          ],
        ),
      ),
    );
  }
}
