import 'package:dart_grammer/d20_class4_get_set2.dart';

void main(){
  var unit1 = Unit();

  // unit1._age =30;   //private 변수라 접근불가
  // unit1.age(30);   //자바의 메서드 호출방식 불가
  unit1.age =30;      //변수에 접근하듯이 사용. 여기에선 의마상 setter
  print(unit1.age);   //여기에선 의미상 getter

  // 그냥 변수명을 사용하는 것과 동일하지만
  //메서드이므로 값의 변경이 가능하다.

  //연속해서 메서드 호출
  var unit2 = Unit()
  ..setName('메딕')..setAge(150);

  print('${unit2.name}, 나이:${unit2.age}');

  //일반적인 메서드 호출방식
  unit2.setName('커멘드센터');
  unit2.setAge(1000);
  print('${unit2.name}, 나이:${unit2.age}');

}