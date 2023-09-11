class Unit{
  int? health;  //초기화가 안될 수도 있다는 뜻
  int? move;


  //초기화 리스트를 사용
  Unit.init() : health = 10, move =1 {    //init말고 다른거 써도 된다.
   //생성자의 구현부가 실행하기 전에 인스턴스 변수를 초기화 할 수 있다.
  }

  //생성자 선언. {}옵션(들어올수도 있고 안들어 올 수도 있음-null일수 있다)
  Unit({int? health}) : move = 2 {
    //전달된 값이 null이면 0으로 초기화 한다.
    this.health = health ?? 0;
  }
}



void main(){
  Unit unit1 =Unit.init();
  print('unit1.health : ${unit1.health}');
  print('unit1.move : ${unit1.move}');
  print('=====================================');


  Marine unit2 = Marine(); //health 인자가 null이므로 health 값이 0이 됨
  // Marine unit2 = Marine(health: 20);
  print('unit2.health : ${unit2.health}');
  print('unit2.move : ${unit2.move}');
  print('unit2.attack : ${unit2.attack}');
}

class Marine extends Unit {
  late int attack; //자식에서 추가한 멤버 변수
  //초기화 리스트를 통해 1로 초기화하고, 나머지는 부모 생성자를 호출한다.
  Marine({int? health})
      : attack = 1,
        super(health: health) {}
}

//리다이렉팅 생성자
//팩토리 생성자
//다트가 아니고 플러터를 배울 것이므로 생략