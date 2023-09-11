import 'dart:io';

//async, awati는 pair: await는 async 내부에서만 사용가능.
Future<void> myRequest1() async{
  //
  print('myRequest1() 작업시작');
  for(int i=0;i<10;i++){
    //1초씩 딜레이 시켜준다. (10초가 소요되는 매우 긴 작업)
    stdout.write('$i ');
    //awiat는 함수에만 사용 가능. 1초 쉬라는 것.
    // 함수내부의 await이므로 메인과는 관계없이 (request작업끝) 에만 관여한다.
    await Future.delayed(Duration(seconds: 1));
  }
  print('\nmyRequest1() 작업끝');
}

//Future<int>객체를 반환하는 메서드
Future<int> myRequest2(num){
  //결과가 미래에 생김. 기다리지 않음.
  var req = Future((){
    print('myRequest2(num) 작업시작');
    int rNum = 0;
    for(int i=0;i<num;i++){
      rNum+=1;
    }
    print('myRequest2(num) 작업끝');
    return rNum;  //이 결과는 나아중에 생김
  });
  //위의 결과가 생성되기 전에 리턴하는 것이므로 잘못된 사용법.
  //결과는 비동기방식으로 생겨나는데 리턴을 동기로 때려버림
  return req;
}

Future<int> myRequest3(num){
  //리턴을 결과값 나왔을때 받게 바꿔줌
  return Future((){
    print('myRequest3(num) 작업시작');
    int rNum = 0;
    for(int i=0;i<num;i++){
      rNum+=1;
    }
    print('myRequest3(num) 작업끝');
    return rNum;
  });
}

Future<int> myRequest4(num){
  //리턴을 결과값 나왔을때 받게 바꿔줌
  return Future((){
    print('myRequest4(num) 작업시작');
    int rNum = 0;
    for(int i=0;i<num;i++){
      rNum+=1;
    }
    print('myRequest4(num) 작업끝');
    return rNum;
  });
}

void main() async{
  //비동기를 위한 async와 await 는 반드시 같이 사용되어야 한다.
  print('main 시작01');
  myRequest1();   //0부터 출력되기 시작함
  print('main 끝01');

  //결과를 기다렸다가 변수에 받음
  print('main 시작02');
  /*
    Future와 then절을 함께 사용하거나 (방법1)
    async와 await를 사용해야 한다. (방법2)
   */
  //await가 붙었으므로 myRequest2가 다 실행되기 전까지 다음코드 딜레이
  var val2 = await myRequest2(1000);  //await가 있어서 위에 async가 있음.
  var val3 = myRequest3(2000000000);
  var val4 = myRequest4(10);
  val3.then((value){
    print("then절에서 출력: $value");
  }, onError: (e){
    print(e);
  });

  //Nook_ 비동기 방식이여도 순서가 적용되네;
  val4.then((value){
    print("then절에서 출력: $value");
  }, onError: (e){
    print(e);
  });


  print('val2 : $val2');
  print('val3 : $val3');  //then절보다 먼저 나옴. 그런데 아직 종료가 안됐으므로 instace만 나옴
  print('val4 : $val4');  //then절보다 먼저 나옴. 그런데 아직 종료가 안됐으므로 instace만 나옴
  print('main 끝02');

/*
  - aysnc await 로 비동기를 동기처럼 보여줌. await뒤의 함수는 Future등이 완성된후에 나타난다.
  - Future는 비동기 방식으로 진행됨. 다른 코드들이 먼저 실행된다.
    (스레드로 던져버리고 밑의 코드를 쭉 실행. 이결과는 then절에서 비동기로 받아줌).
*/
}
