import 'package:dart_grammer/d03_variables_use.dart';

void main(){
  //***Nullable & Non-Nullable ***
  int num1 =5;    //null값을 허용하지 않는 변수로 선언
  int? num2 =2;   //null값을 허용하는 변수. 값이 없으면 null

  //num1 = null;  //에러 발생 : Non-Nullable
  num2 = null;    // ok : Nullable

  //num1 = null;  //에러 발생 : Nun-Nullable
  num2 = null;    //ok : Nullable

  //String str1 = null    //error : Non-Nullable
  String? str2 = null;    //ok : Nullalble

  print("1===================================");

  //***Null Safety 규칙 ***     null 일때 안전하게 사용하기 위해

  //Non-Nullable 변수는 값 대입 없이 사용할 때 error
  //int a1; print(a1) //에러발생
  int? a2; print(a2);

  //a2변수는 Nullable. 선언과 동시에 초기값이 null이 대입되어 초기화
  //a1은 Non-nullable. null로 자동 초기화 불가

  //var 타입에서의 Null Safety
  //int 타입으로 유추. Non-Nullable 변수임으로 null대입 불가능

  var a3=10;
  var a4 = null;    //dynamic 으로 유추
  var a5;           //dynamic 으로 유추
  //var? a6 = null; //error

  //var로 타입 선언시 Nullable 과 Non-Nullable로 자동 유추.
  //var 타입 뒤에는 ? 추가 할수 없다.

  print("1===================================");

  //***Null Safety Operator***

  int num3 =5;
  int? num4;

  // ! : null check operator - runtime error throw
  //변수 뒤에 !을 추가하면 이 변수 값이 null인 경우 runtime error 발생

  // num4 =10;     //이 줄이 없으면 다음 줄 에러
  // num3 = num4;  //컴파일 전 체크
  /*
    런타임때 에러가 나면 여기서 났다고 알려주는역할.
    null값이 아니게 들어오는 변수에 null이 들어오면 나머지는실행되고
    오류값을 표시해준다 (printstacktrace(e);)
  */

  num3 = num4!; //실행 시 체크(에러가 남)

  // print(num4);

  //?.?[ ] ?.. - null aware operator
  //String name;
  String? name;

  //Nul이 아닐때 메서드 실행
  /*
    ?를 제거하면 에러발생됨.
    객체가 null인 상태에서는 멤버메서드를 호출할 수 없기 때문이다.
   */
  name = name?.toLowerCase();

  //Null 일 때
  /*
    n42는 정수가 아니므로 정수로 변환시 에러발생(false).
    따라서 val2 는 -1로 초기화된다.
   */
  int val2 = int.tryParse('n42') ?? -1;
  print('val2 = $val2');

  String? name1;
  //name1 ='널값이 아니게'; //이 값이 없으면 런타임 에러가 난다.
  // String text = name1;
    /*그럼 저렇게 에러가 뜨면 어떻게 해야하나?
     1. 변수 뒤에 !를 붙여 런타임 에러체크를 한다.
        - flutter는 사용되는 시점-런타임-(컴파일시에는 넘김)에서
        null값이 오면 에러를 보여준다.
     2. String에 ? 를 붙여 nullsafety 시켜준다.
     */
    String text = name1!;
    print(text);
}