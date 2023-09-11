class Marine{
  // late int health;
  // late int attack;
  //
  // Marine(int health , int attack){
  //   this.health = health;
  //   this.attack = attack;
  // }

  //앞에서 했던 방식. 이것을 간단하게 사용한 것이 아래방법
  final int health;
  final int attack;
  //상수 생성자 : with final 변수
  //자바로 보면 static 선언한 것과 비슷
  const Marine(this.health, this.attack);
  /*
    하나의 객체로 여러번 사용하고 싶다면 const 생성자를 이용하여
    객체를 생성해야 한다. 플러터의 모든 객체에 다양하게 사용되고 있다.
   */
  //NOOk 값 공유하는지 해볼것
  // Marine.addhealt() : health +=1{};

}


void main(){
  Marine unit1 = Marine(10, 1);   //new가 생략되어있으므로
  Marine unit2 = Marine(10, 1);   //새로운 객체임
  Marine unit3 = const Marine(10, 1);
  Marine unit4 = const Marine(10, 1);   //같은것을 사용한 것임 변경시 같이 적용
  Marine unit5 = new Marine(10, 1);
  Marine unit6 = new Marine(10, 1);
  //NOOK unit3.health = 0;
  print(unit3.health);
  print(unit4.health);
  
  /*
  identical(객체1, 객체2)
    :인자로 주어진 객체의 주소값을 비교하여 동일하면 true 반환
   */
  print(identical(unit1, unit2));   //false
  print(identical(unit1, unit3));   //false
  print('=========================');

  print(identical(unit1, unit3));   //false
  print(identical(unit3, unit4));   //true <-----
  print('=========================');

  print(identical(unit1, unit5));   //false
  print(identical(unit3, unit5));   //false
  print(identical(unit6, unit5));   //false
  print('=========================');

}