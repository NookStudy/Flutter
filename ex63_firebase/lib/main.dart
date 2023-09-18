import 'package:firebase_core/firebase_core.dart';
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
      home: const MyHomePage(title: 'EX63 Firebase'),
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

  String name = '';

  FirebaseOptions get firebaseOptions => const FirebaseOptions(
    appId: '1:177651748899:android:41da445c4fca1866376196', 
    apiKey: "AIzaSyDl5a5ruckARHThWcC-amWAqP176O9lYOA", 
    projectId: 'flutter-exam-da7f1',
    messagingSenderId: '177651748899', 
  );

  Future<void> intitializeDefault() async{
    FirebaseApp app = await Firebase.initializeApp();
    name = app.name;
    print('Initialized default app $app');
  }

  Future<void> intitiallizeSecondary() async{
    name = 'myFcm';
    FirebaseApp app = await Firebase.initializeApp(
      name: name,
      options: firebaseOptions
    );
    print('Initiallized $app');
  }

  //현재는 하나이지만 여러개를 사용할 경우 : FCM, Storage, Auth...
  void apps(){
    final List<FirebaseApp> apps = Firebase.apps;
    print('Currently initialized apps: $apps');
  }

  void options(){
    final FirebaseApp app = Firebase.app(name);
    final FirebaseOptions options = app.options;
    print('Current options for app $name : $options');
  }

  Future<void> delete() async{
    final FirebaseApp app = Firebase.app(name);

    await app.delete();
    print('App $name deleted');
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
              onPressed: intitializeDefault,
              child: const Text('Initialize Default app'),
            ),
            ElevatedButton(
              onPressed: intitiallizeSecondary,
              child: const Text('Initialize secondary app'),
            ),
            ElevatedButton(
              onPressed: apps,
              child: const Text('Get app'),
            ),
            ElevatedButton(
              onPressed: options,
              child: const Text('List options'),
            ),
            ElevatedButton(
              onPressed: delete,
              child: const Text('delete'),
            ),
          ],
        ),
      ),
    );
  }
}
