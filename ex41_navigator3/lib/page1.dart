import 'package:ex41_navigator3/page2.dart';
import 'package:ex41_navigator3/page3.dart';
import 'package:flutter/material.dart';


//final이 아닌 하나이상의 인스턴스 필드를 정의할 때 노란줄이 보임.
// ignore: must_be_immutable
class Page1 extends StatefulWidget {
  //파라미터로 전달된 값을 받을 변수
  String? data = '';
  Page1({super.key, required this.data});

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
              //버튼1을 누르면.... 비동기로 동작한다.
              onPressed: () async{
                //변수 data의 값을 반 문자열로 만든다.
                setState(() {
                  widget.data = '';
                });
                //2페이지를 스택에 추가한다.
                //2페이지에서 콜백 데이터가 넘어오길 기다린다. (await)
                String? value = await Navigator.push(
                  context, 
                  MaterialPageRoute(
                  //2페이지를 추가하면서 파라미터를 전달한다.
                    builder: (context) => Page2(data: '1페이지에서 보냄(1->2)')
                  ),
                );
                //2페이지에서 콜백해준 데이터를 여기서 출력
                print('result(1-1): $value');
                setState(() {
                  widget.data = value;
                });
              }, 
              child: const Text('2페이지 추가', style: TextStyle(fontSize: 24),)
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              //3페이지를 스택으로 추가
              onPressed: () async{
                //변수내용 지움
                setState(() {
                  widget.data!='';
                });
                await Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context)=> Page3(data: '1페이지에서 보냄(1->3)')),
                ).then((value) {
                  //3페이지에서 콜백 데이터가 정상적으로 넘어오면 then절이 실행된다.
                  //콘솔출력 및 화면 재렌더링
                  print('result(1-2):$value');
                  setState(() {
                    widget.data = value!;
                  });
                });
              }, 
              //파라미터로 넘어오는 데이터를 
              child: const Text('3페이지 추가', style: TextStyle(fontSize: 24),)
            ),
            //파라미터로 전달받은 텍스트 값을 위젯에 출력
            //리플레이스먼트로 갔다가 오면 기존페이지가 사라지므로 value값은 사라지고 Null이 돌아온다.
            Text(widget.data!, style: const TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}