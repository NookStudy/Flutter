class Unit{
  late String name;
  late int age;

  //기본 생성자 : <--이름 없는 생성자
  // - 클래스 명과 동일.
  // - 인자없다
  // - 부모 클래스의 기본 생성자 호출
  // - 이름 있는 생성자가 없다면 자동으로 호출된다.

  // 기본 생성자에 수행 동작 추가
  Unit(){
    this.name = '홍길동';
    this.age =10;
  }
  
  //이름 잇는 생성자 추가 사용 : 클래스명.생성자명
  //오버로딩이 안되기 때문에 이렇게 사용함. 필수
  Unit.init1(name){
    this.age = name;
    this.age = 10;
  }

  Unit.init2(name,age){
    this.name = name;
    this.age = age;
  }
}

void main(){
  
  //이름 있는 생성자 사용시, 기본 생성자를 사용하려면
  //기본 생성자를 명시적으로 선언해야 한다. (자바도 동일)
  Unit myUnit1 = Unit();    //new 생략
  
  Unit myUnit2 = Unit.init1('마린');
  
  Unit myUnit3 = Unit.init2('마린',30);
  
  //초기화 리스트
  //리다이렉팅 생성자
  //상수생성자
  //팩토리 생성자
  //다트가 아니고 플러터를 배울 것이므로 생략
}