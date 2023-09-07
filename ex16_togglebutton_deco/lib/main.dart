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
      home: const MyHomePage(title: 'EX16 ToggleButton_Deco'),
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
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];
  var isSelected3 = [false, false, true];

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
            const Text(
              'multi-select', textScaleFactor: 2,
            ),
            //여러개 선택 가능한 토글
            ToggleButtons(
              //이벤트 리스너 : 누른 버튼의 인덱스가 매개변수로 전달됨
              onPressed: (int index) {
                  setState(() {
                    // !가 변수앞에 있으므로 Not연산자임(주의)
                    isSelected1[index] = !isSelected1[index];
                    print('isSelected1 : $isSelected1');
                    print('index : $index');
                  });
              }, 
              //각 버튼의 값으로 사용할 List설정
              isSelected: isSelected1,
              //각 버튼의 아이콘을 설정
              children: const[    //아이콘자체는 변하지 않으므로
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
            ),
            const SizedBox(height: 20,),
            //singleSelect
            const Text('sigle select', textScaleFactor: 2,),
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  for (var i = 0; i < isSelected2.length; i++) {
                    if (i==index) {
                      //선택항목만 활성화
                      isSelected2[i] = true;
                    } else {
                      //반복에 의해 나머지는 비활성화
                      isSelected2[i] = false;
                    }
                  }
                  print('isSlected2 : $isSelected2');//로그용
                });
              },
              isSelected: isSelected2,
              children: const[
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
            ),
            const SizedBox(height: 20,),
            //fancy
            const Text('fancy', textScaleFactor: 2,),
            ToggleButtons(
              borderColor: Colors.blueGrey,
              borderWidth: 10,
              selectedBorderColor: Colors.blue,
              splashColor:Colors.red ,   //선택될 때 잠시 보인다.
              color: Colors.blue,           //노멀상태의 그림 색
              selectedColor: Colors.green,  //선택된 그림의 색
              fillColor: Colors.yellow,     //선택된 버튼의 배경색
              //disabledColor
              borderRadius: BorderRadius.circular(28), //제대로 적용안됨. 되는데..?
              isSelected: isSelected3,
              children: const [
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Text('cake'),
              ],
              onPressed: (int index) {
                setState(() {
                  for (var i = 0; i < isSelected3.length; i++) {
                     if (i==index) {
                      //선택항목만 활성화
                      isSelected3[i] = true;
                    } else {
                      //반복에 의해 나머지는 비활성화
                      isSelected3[i] = false;
                    }
                  }
                  print('isSelected3 : $isSelected3');
                });
              }
            ),
          ],
        ),
      ),
    );
  }
}
