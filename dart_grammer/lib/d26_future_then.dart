import 'dart:math';

/*
  메서드의 반환 타입 형태로 future객체를 사용.
  나중에 결과를 준다는 의미
*/
Future<int> myRequest1(num){  //미래에 <int> 반환
  return Future(() {
    int rNum =0;
    // 전달된 인수만큼 반복하므로 시간이 걸리는 작업
    for(int i=0; i<=num; i++){
      rNum = rNum+i;
    }
      return rNum;
  });
}
void main(){
  print('main시작 1-1');
  //메서드 호출 후 future<int> 객체를 반환한다.
  var myReq1 = myRequest1(1000);    //결과를 기다리지 않고 다음 진행
  print('after myReqeust1-1'); //먼저 튀나온다
  myReq1.then((data){
    //결과가 도착하면 나중에 출력한다.
    print('main작업1-1 : $data'); //나중에 출력 but future중 제일먼저 출력
  }, onError: (e){
    print(e);
  });
  print('main끝 1-1 ');
  print("==========================");

  print('main시작 1-2 ');
  //호출과 동시에 then절 사용. 상동
  myRequest1(2000000000).then((data){
    print('main작업 1-2 : $data');  //future중 두번째 출력
  }, onError: (e){
    print(e);
  });
  print('main끝 1-2 ');
  print("==========================");

  // Nook_ future가 몇개여도 future자체는 순서대로 진행된다.
  // 병렬작업은 안되나..?

  //내부 클래스에 사용할 변수생성.
  int nCount = 10;    //다음은 이너클래서(내부클래스)이므로 이 변수 사용가능
  //Future 객체를 통해 내부클래스로 정의
  Future<int> myRequest2 = new Future((){
    int rNum = 0;
    for(int i=0; i<=nCount; i++){
      rNum = rNum+i;
    }
    return rNum;
  });

  //Future객체를 통해서 즉시 실행
  print('myReqeust2 시작3 ');
  myRequest2.then((data){
    //미래에 결과가 도착하면 출력
    print('myRequest2 작업3 : $data');  //future중 세번째 출력. 마지막에 출력
  }, onError: (e){
    print(e);
  });
  print('myRequest2 끝3 ');
  /*
    위에서 호출한 3개의 메소드는 모두 다 시간이 많이 걸리는 작업으로
    main()메서드가 종료되더라도 실행되다가, 결과가 콜백되면 그때 종료된다.
    (Nook_일종의 thread..?)
    Java의 Thread(쓰레드)와 유사한 동작방식을 가진다.
 */
  print('end of main');
  print("==========================");
}