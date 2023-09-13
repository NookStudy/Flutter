
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Page1 extends StatefulWidget {
  /// main.dart 에서 전달한 파라미터를 받기 위해 변수를 선언한 후 생성자에 추가한다.
  /// 또한 required가 있으므로 필수적으로 받아야 하는 값이 된다.
  String data = '';
  Page1({Key? key,required this.data}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async{
                /*
                  Route에서는 push() 대신에 pushNamed(내용,경로를 지정)를 쓴다.
                  새로운 페이지에서 콜백데이타가 올때까지 대기(await)한다.
                */
                //결과 데이터를 받을 변수는 var로 설정. String으로 받으면 에러발생
                //이미 있는 페이지를 부름.
                //Nook_걍 다이나믹으로 받으면 편할거 같은데
                dynamic result = await Navigator.pushNamed(context,'/page2');
                print('result(from 2) : $result');
                //콜백 데이터를 화면에 적용하기 위해 재렌더링 한다.
                setState(() {
                  //결과 데이터를 명시적으로 String 으로 형변환 후 data에 설정
                  // widget.data = result as String;
                  widget.data = result;
                });
              },
              child: const Text('2페이지 추가', style: TextStyle(fontSize: 24),)
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async{
                await Navigator.pushNamed(
                  //기다리다 콜백이 오면 then절 실행
                  context, '/page3'
                ).then((result) {
                  print('result(from 3) : $result');
                  setState(() {
                    widget.data = result as String;
                  });
                });
              }, 
              child: const Text('3페이지 추가', style: TextStyle(fontSize: 24),)
            ),
            //초반실행에는 main에서 넘어온 '시작'이 출력된다.
            Text(widget.data, style: const TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}