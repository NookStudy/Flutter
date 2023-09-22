import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_lecture/screen/home_screen.dart';
import 'package:netflix_clone_lecture/screen/like_screen.dart';
import 'package:netflix_clone_lecture/screen/more_screen.dart';
import 'package:netflix_clone_lecture/screen/search_screen.dart';
import 'package:netflix_clone_lecture/widget/bottom_bar.dart';
void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDefault();
  runApp(const MyApp());
}

Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    print('Initialized default app $app');
  }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  
  late TabController controller;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bbongflix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        hintColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              // Container(
              //   child: const Center(
              //     child: Text('home'),
              //   ),
              // ),
              SearchScreen(),
              LikeScreen(),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: const Bottom(),
        ),
      ),
    );
  }
}