void main(){
  //Map : key, vlaue 로 이루어진 데이터

  var map1 = {
    'key1' : "홍길동",
    'key2' : 2,
    'key3' : true
  };    //중복을 허용하지 않음. 중괄호 사용.
  print(map1);

  /*
   Map 컬렉션 생성시 key는 문자열로, value는 정수값을 사용하겠다는
   선언. Map은 이와같이 Key와 Value의 쌍으로 이루어진다.
   */
  Map<String,int> map2 =Map();  //new 생략
  map2['홍길동'] = 20;
  map2['전우치'] = 25;
  map2['손오공'] = 30;
  print(map2);

  map2['멀린'] =35; //추가(기존의 Key값이 없기 때문에 추가가능)
  map2['홍길동']=21; //수정
  print(map2);

  map2.remove('홍길동'); //데이터 삭제
  print(map2);

  //***값 빠르게 찾아오는 것이 목적***
  int? val1 = map2['홍길동'];  //찾는 값이 없으면 null반환
  print(val1);

  int val2 = map2['홍길동'] ?? -1;
  print(val2);

  //var 연산자의 경우 입력된 데이터에 따라 타입이 결정된다.
  //단, type이 결정된 이후에는 다른 타입으로 변경할 수 없다.
  var val3 = map2['홍길동'];
  /*
    따라서 선언부에 nullsafety(?)를 붙일 필요가 없음
    삼항연산자. 앞의 값이 null이면 false를 반환하여 뒤의 값을 선택
   */
  print('val3 = ${val3}');  //null이 출력됨
  val3 =1;    //null값이 입력되면 아직 타입이 정해진게 아님. 입력가능
  print(val3);
  // val3 = '스트링'; //위에서 val3가 int로 결정났으므로 타입변경불가

  var bCheck = map2.containsKey('멀린');
  //해당 map이 해당 key값을 가지고 있는지 점검
  if(bCheck){
    print("멀린은 존재하는 키입니다.");
  }
  var vCheck = map2.containsValue(35);
  if(vCheck){
    print("35는 존재하는 Value입니다.");
  }

  //반복
  print('=====================================================');
  for(var key in map2.keys){
    print('$key : ${map2[key]}');
  }
  print('=====================================================');

  //원소를 통해 각 key와 value를 출력한다. entries(항목)
  for(var e in map2.entries){
    print('${e.key} : ${e.value}');
  }
  print('=====================================================');

  //스프레드 연산자(...) : 두개의 컬렉션을 연결한다.
  var map3 = {
    ...map1,
    'key4' :'전우치'
  };
  print(map3);
}