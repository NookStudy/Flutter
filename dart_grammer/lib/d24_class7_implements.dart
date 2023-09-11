abstract class Greet{
  greet();
}

abstract class Talk{
  talk();
}

//하나만 상속 가능
class Morning extends Greet{ //,Talk
  @override
  greet() {
    print("아침인사");
  }
}

//여러개 구현가능
class Evening implements Greet,Talk{
  greet(){print("저녁인사");}
  talk(){print("스몰토크"); }
}

void main(){
  Morning m = Morning();
  m.greet();

  Evening e = Evening();
  e.greet();
  e.talk();
}