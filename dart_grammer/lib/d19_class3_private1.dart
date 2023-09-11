
import 'package:dart_grammer/d19_class3_private2.dart';

class Unit{
  //변수명 그냥 쓰면 public, _로 시작하면 private(암묵적)
  late String _name;
  late int _age;

  //생성자 간단하게 사용하기
  //어차피 연결할 거... 파라미터 부분에서...
  Unit(this._name, this._age);
}

void main(){
  var unit1 = Unit('마린', 25 );
  print(unit1._name);   //private지만 에러없이 출력됨(Java는 에러)
  print(unit1._age);

  //Unit2 클래스의 경우 외부에서 정의되었으므로 private 멤버는 접근할 수 없다.
  var unit2 = Unit2('메딕', 20);
  // print(unit2._name);    //private 적용됨 - 다른 파일이므로 에러남
  // print(unit2._age);     //private 적용됨
}
/*
  dart에서는 하나의 파일이 하나의 library이다.
  그래서 private 으로 할 경우 해당 파일에만 or 해당 라이브러리에만 접근이 가능.
  외부 파일에서는 접근이 불가능하다.
 */