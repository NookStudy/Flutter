void main(){
  //메서드도 변수에 대입이 가능
  //Dart에서는 메서드를 객체로 취급하기 때문
  var myFunc = addTwoNum;
  // var myFunc = addTwoNum(); //이러면 이제 평범한 변수

  //변수를 이용하여 메서드 호출 : 메서드명의 리네임수준
  myFunc(1,2);
  print(add(2,4));

  //메서드 파라미터에 메서드를 사용
  something('2', "3", myFunc);
  something('2', "5", addTwoNum); //동일
}

void addTwoNum(int a, int b){
  print(a+b);
}

int add(int a, int b){
  int result = a+b;
  return result;
}


void something(var a, var b, var c){
  int val1 = int.parse(a);
  int val2 = int.parse(b);

  //c는 메서드이므로..
  c(val1,val2);
}