void main(){
  something1('홍길동');

  something2('전우치');
  something2(30);

  //*** Named parameters***
  /*
    매개변수를 이름을 통해 부여할 수 있다.
    따라서 순서를 변경할 수 있다. set{}처럼 키값으로 찾아간다.
  */


  //파라미터를 옵션 처리하기
  something3(); //선택형 매개변수이므로
  //이렇게 {} 돼있는 것은 사용해도 되고 안해도 됨.
  something3(name: '손오공');

  //뒤의 파라미터만 이름을 주어 값을 전할 수 있다.
  /*
    옵션이 있는 것은 아래와 같이 사용하면 됨.
    하나만 사용해도 되고, 둘다 사용해도 된다.
    형식은 (key:value)만 지키면 된다.
   */
  something4();
  something4(age: 20);
  something4(name: '유비');
  //중괄호(Set)으로 파라미터를 정의했으므로 순서는 상관없음.
  something4(name: '하후돈', age: 12);
  something4(age: 12, name: '하후돈');

  // 필수 +옵션. 필수는 반드시 사용해야 한다. {}는 사용해도 되고 안해도 됨.
  //이렇게 헷갈리기 때문에 나중에는 다 옵션으로 많이 사용한다.
  something5('해리포터');
  something5('멀린', age: 20);
  //필수가 있는 경우 순서바꾸기가 불가능하다.(set이 아니므로 당연할지도..)
  //something5(age: 12, name: '하후돈');

  //default 10
  something6('이순신');
  something6('강감찬', age: 30);

  //둘다 필수값임 (not null)
  something7('권율', age: 30);

}

//자바처럼 사용
void something1(String name){
  print(name);
}

//파라미터 타입을 생략하면 dynamic이 됨
void something2(name){
  print(name);
}

//파라미터 옵션처리. {}의 데이터는 whether insert or not all ok
//null 값이 들어갈수 있게 처리해야 하므로 nullsafety(?) 필수
void something3({String? name}){
// void something3({var name}){ //nullsafety안할거면 var를 써라
  print("name : $name");
}

/*
  메서드 오버로딩
    - 메서드를 정의할 때 동일한 이름으로 정의하되
    매개변수의 개수나 타입을 다르게 해서 서로 다른 메서드 처럼 정의하는 기법.
    예) myFunc(int a), myFunc(int a, int b), myFunc(double a, Stirng b)
    위 3가지 메서드는 모두 다르다.
 */
//여러가지 파라미터를 처리하기 위해 오버로딩 할 필요가 없다.
//중괄호로 묶인 2개의 parameter => Set으로 정의됨.(parameter의 순서가 없다)
void something4({String? name, int? age}){
  print('name : $name age : $age');
}

//필수 + 옵션
void something5(String name,{int? age}){
  print('name : $name age : $age');
}

//파라미터의 디폴트 값. ? 빠진다.
//oracle의 default on null과 같다.
void something6(String name,{int age=10}){
  print ('name : $name age : $age');
}


//반드시 필요한 파라미터라면... 이전방식 @required
void something7(String name, {required int age}){
  print ('name : $name age : $age');
}
//default on null not null 은 불가
/*
  void something8(String name, {required int age = 10}){
    print ('name : $name age : $age');
  }
*/

