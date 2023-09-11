class Unit{
  //멤벼 변수를 private로 선언. 정보 은닉화를 위하여.
  late String _name;
  late int _age;

  String get name =>  'My name is $_name.';


  // 메뉴를 이용하여 자동생성 : [메뉴] Code => Generate
  // Dart에서 사용하는 getter, setter

  int get age => _age;

  set name(String value) {
    _name = value;
  }

  set age(int value) {
    _age = value;
  }

  //일반 메서드 형태로 세터 메서드 직접 생성
  //자바에서 사용하는 getter, setter. 이렇게 사용해도 됨.
  void setName(String name){
    _name = name;
    // this._name = name; //Nook 어차피 _(언더바) 있어서 this가 필요없대
  }
  void setAge(int age){
    _age = age;
  }

}
