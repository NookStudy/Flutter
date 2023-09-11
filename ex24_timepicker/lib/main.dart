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
      home: const MyHomePage(title: 'EX24 TimePicker'),
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

  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedMinute = '';
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
              '${_selectedTime.hour}:${_selectedMinute}',
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
            child: const Text('Show TimePicker', style: TextStyle(fontSize: 24),),
            onPressed: () => selectTime(), 
            )
          ],
        ),
      ),
    );
  }

  //타임을 셀렉한뒤 나타내겠다
  Future selectTime() async{
    //showtimepicker를 통해 시간반환
    TimeOfDay? picked = await showTimePicker(
      /*
        context값이 필요하면 future 타입으로 TimeOfDay타입의 값을 반환한다.
        TimeOfDay 클래스에는 시간과 분 정보가 있다.
      */
      context: context, 
      initialTime: TimeOfDay.now(),
      //###-----------------------------------------
      builder: (BuildContext context, Widget? child){
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
            // ### change the border color ###
            primary: Colors.pink,
            //### choange the text colro###
            onSurface:  Colors.pink,
            ),//여기서 사용자가 시간을 선택할때까지 코드가 블럭됨
            // ### button clolors ###
            // buttonTheme : ButtonThemeData(
            //   colorScheme: ColorScheme.light(
            //     primary: Colors.green,
            //   )
            // )
          ), 
          child: child!,
        );
      },
      //##--------------------------------------------
    );
    //타임피커를 통해 선택한 시간으로 설정한다.
    if (picked!=null) {
      setState(() {
        _selectedTime= picked;
        _selectedMinute = _selectedTime.minute.toString();
        if (_selectedMinute.length<2) {
          _selectedMinute = '0$_selectedMinute';
        }
      });
    }
  }
}
