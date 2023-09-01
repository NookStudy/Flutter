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
      home: const MyHomePage(title: 'Ex04 Icon'),
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
      body: Container(    //아이콘은 상수이기 때문에 아래모두 상수처리하짐라고
                            //여기서 상수처리하면됨
        child: const Column(
          children:<Widget> [
            /*우리가 만든 거엔 Widget없음. 필요없다는 뜻*/
            Row(
              children: [
                Icon(
                  Icons.camera_alt,
                  color: Colors.red,  
                  size: 35.0,
                ),
                Icon(
                  Icons.gps_fixed,
                  color: Colors.orange,  
                  size: 35.0,
                ),
                Icon(
                  Icons.access_alarm,
                  color: Colors.orange,  
                  size: 35.0,
                ),
                Icon(
                  Icons.add_location,
                  color: Colors.orange,  
                  size: 35.0,
                ),
                Icon(
                  Icons.attach_file_outlined,
                  color: Colors.orange,  
                  size: 35.0,
                ),
                Icon(
                  Icons.add_photo_alternate,
                  color: Colors.orange,  
                  size: 35.0,
                ),
                Icon(
                  Icons.audiotrack_outlined,
                  color: Colors.orange,  
                  size: 35.0,
                ),
                Icon(
                  Icons.bluetooth_outlined,
                  color: Colors.orange,  
                  size: 35.0,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orange,  
                  size: 35.0,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.orange,  
                  size: 35.0,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.orange,  
                  size: 35.0,
                ),
              ],
            ),
         
       
         Row(
             children:<Widget> [
            Icon(
              Icons.cancel,
              color: Colors.orange,  
              size: 35.0,
            ),
          ],
        ),
         ],
      ),
       ),
    );
    
  }
}

