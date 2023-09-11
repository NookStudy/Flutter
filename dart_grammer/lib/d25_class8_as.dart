class Point{
  int? x;
  int? y;
}

class PointDetail extends Point{
  int? z;
}

// void main(){
//   PointDetail p1 = PointDetail();
//   p1.x = 4; //setter
//   p1.y = 5;
//   p1.z = 6;
//   /*
//     자식클래스(PointDetail)을 부모클래스(Point)로 타입 캐스팅하는 것을
//     업캐스팅(up-casting)이라 한다.
//    */
//     //부모타입으로 캐스팅해서 사용하다가 자식객체를 다시 받아야 할 때
//   Point p2 = p1;    //p2가 p1을 받으면서 업캐스팅
//   /*
//     Nook => 업캐스팅은 마치 객체를 Object에 담는것과 같다.
//     어차피 담김. 마치 Collecton coll = new List();  이런것과 비슷.
//    */
//
//
//   //...
//   //다시 pointdetail의 z값에 접근하거나 사용해야 할 때.
//   if (p2 is PointDetail){   //is로 판단해서 한번 확인했기 때문에 as 생략가능
//     PointDetail p3 = p2 as PointDetail;   //다운캐스팅
//     print(p3.z);
//     print("ㅇㅇ");
//   }else{
//     print("nono")
//   }
//
//   //Nook => dart공식. is로 확인해서 as 로 형변환해라.
//   //Use the as operator to cast an object to a particular type if and only if you are sure that the object is of that type.
// }





class Unit{
  var health =10;
}

//자식클래스 정의 (Unit을 상속)
class Marine extends Unit{
  var name = "마린";
}

class Medic extends Unit{
  var name ="메딕";
}

void main(){
  Marine marine = Marine();
  Medic medic = Medic();

  //marine medic을 부모객체로 업캐스팅.당연히 되니까...
  Unit unit1 = marine as Unit;  //객체의 형변환을 위해 as를 사용한다.
  Unit unit2 = medic;    //현재 버전에서는 as 없이도 형변환이 가능하다.



  if (unit1 is Marine){     //원래의 클래스를 확인
    print('마린입니다.');
    print(unit1.name);      //자바와는 다름. 자바는 이렇게 참조가 안됨
    // ^ 위처럼 is를 통해 객체의 원타입을 확인한 후에 자식변수를 확인할수 있다.
  }else{
    print("마린이 아닙니다.");
  }
  /*
    자바에서는 부모타입의 참조변수로 자식쪽 멤버변수에 접근할 수 없다.
    하지만 다트에서는 가능.
    마치 변수까지 오버라이딩 되는 듯한 느낌이라 생각하면 된다.
   */

  //print(unit1.name); => 단독적으로는 해당문장은 사용할 수 없다.
  /*
    이 문장을 of문 블럭 외부로 옮기면 에러가 발생한다.
    is를 통해 부모타입을 자식타입으로 변환이 가능한지 확인한후
    접근을 허용하게 된다.
   */

  //as없이 대입해도 정상적으로 출력된다.
  if(unit2 is Medic){
    print("메딕입니다.");
  }else{
    print("메딕이 아닙니다.");
  }
}
