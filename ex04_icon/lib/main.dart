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
      body: Container(    //아이콘은 상수이기 때문에 아래모두 상수처리하지말고
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
            Icon(
              Icons.smoking_rooms_rounded,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.sms,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.sms_failed_outlined,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.telegram_rounded,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.telegram_outlined,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.telegram_sharp,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.telegram,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.collections_bookmark,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.construction,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.content_cut,
              color: Colors.orange,  
              size: 35.0,
            ),
          ],
        ),
         Row(
             children:<Widget> [
            Icon(
              Icons.copy_outlined,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.data_object,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.do_not_disturb,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.home,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.favorite,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.thumb_down,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.thumb_down_off_alt,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.thumb_up,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.thumb_up_off_alt,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.construction,
              color: Colors.orange,  
              size: 35.0,
            ),
            Icon(
              Icons.content_cut,
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

