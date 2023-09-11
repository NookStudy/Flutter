import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';     //sn_progress_dialog
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
      home: const MyHomePage(title: 'EX22 ProgressDialog'),
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

  Future _normalProgress(context) async { // sn_progress_dialog 1.0.8
    /// Create progress dialog
    ProgressDialog pd = ProgressDialog(context: context);

    /// Set options
    /// Max and msg required
    pd.show(
      max: 100,
      msg: 'File Downloading...',
      progressBgColor: Colors.transparent,
    );
    for (int i = 0; i <= 100; i++) {
      pd.update(value: i);
      i++;
      await Future.delayed(const Duration(milliseconds: 100));  // 속도
    }
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
              child: Text(
                'Show ProgressDialog',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: ()=> _showProgressDialog('loading...'),
            ),
            MaterialButton( // sn_progress_dialog 1.0.8
              color: const Color(0xfff7f7f7),
              child: const Text('Normal Progress'),
              onPressed: () {
                _normalProgress(context);
            }),
          ],
        ),
      ),
    );
  }

  Future _showProgressDialog(String msg) async{
    await showDialog(
      context: context, 
      //화면의 빈부분을 눌럿을 때 종료
      barrierDismissible: true,//false: 눌렀을 때 변화 없음,
      builder: (BuildContext context){
        //테스트 할 때 3초후 창닫기
        Future.delayed(const Duration(seconds: 3),(){
          //작업완료시 창닫기
          Navigator.pop(context);
        });
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white), 
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            //대화창의 외부 크기
            content: SizedBox(
              height: 400,  //높이를 지정해보자
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //인디케이트 창
                  const SizedBox(
                    //인디케이트의 모양 혹은 색 설정
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                      strokeWidth: 5.0,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Text(
                    msg,
                    style: const TextStyle(fontSize: 24, height: 1.5),
                  )
                ],
              )
            ),
          )
        );
      }
    );
  }

}
