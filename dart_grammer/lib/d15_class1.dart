class Unit{
  //?로 Nullable로 처리할 수도 있지만
  //나중에 초기화된다는 것을 명시해 줌
  late String name;
  // String? name //위랑 같은 소리는 아님. null은 못들어오니까
  late int age;
  //Unit(){} //디폴트 생성자
  //dart에서는 오버로딩이 불가능!!
  Unit(String name, int age){   //자바로 치면 오버로딩 한 것인데
    this.name = name;
    this.age = age;
  }

  void main(){
    //디폴트 생성자가 없으므로 에러
    // var unit1 = new Unit();

    //자바와 같은 방색 - dart에서 권장하지 않음
    var unit2 = new Unit("마린",20);

    //보통은 new가 옵션이라 생략
    var unit3 = Unit('메딕',25);

    //late로 선언하는 경우 객체생성시 반드시 null이 아닌 값으로 초기화 해야함.
    var unit4 = Unit('파이어뱃',35);

    print('unit2=${unit2.name},${unit2.age}');
    print('unit3=${unit3.name},${unit3.age}');

  }
}