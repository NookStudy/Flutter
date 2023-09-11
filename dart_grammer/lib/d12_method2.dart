import 'package:dart_grammer/d11_method1.dart';

void main(){
  //*** Positional parameters***
  /*
    매개변수의 위치에 따라 값을 부여한다.
    따라서 순서를 변경할 수 없다. 자주쓰지는 않는다.(자바의 오버라이딩 메소드와 거의 비슷?)
 */


  //파라미터를 옵션 처리하기
  something1();
  something1('홍길동 ');
  
  
  something2('해리포터');
  something2('멀린',20); //앞의 것을 사용하지 않고 뒤에것을 사용할 수 없음
  // something2(age: 20); //사용불가
  // something2(age:20,name:'장비'); //사용불가
  // something2(20,'장비'); //사용불가(순서가 안맞아서)
  
  //마치 something2와 사용법이 동일한 것 처럼 보인다. 단 이유는 좀 다름
  something3('전우치'); 
  something3('손오공',20);
  // something3(age:30); //사용불가(String이 필수라)

  //필수 + 옵션
  something4('이순신');
  something4('강감찬',20);
  // something4(30,'을지문덕') //바꿔서 사용불가
}

//파라미터 옵션처리
//[]를 사용해도 되고 안해도 된다.
// 파라미터 미입력시 null이 올수 있게 ?를 사용
void something1([String? name]){
  print('name : $name');
}

//여러가지 파라미터를 처라히기 위해 오버로딩 할 필요가 없다.
void something2([String? name, int? age]){
  print('name : $name age : $age');
}

//필수 + 옵션
void something3(String? name, [int? age]){
  print('name : $name age : $age');
}

//파라미터의 디폴트 값. ? 빠진다.
void something4(String name, [int age=10]){
  print('name : $name age : $age');
}
