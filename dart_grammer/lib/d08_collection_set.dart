void main(){
  //Set : 데이터 순서가 없고 중복 허용하지 않음
  /*
  List는 배열과 같아서 인덱스가 있고, 중복이 허용된다.
  Set은 집합과 같아서 데이터의 순서가 없고 중복이 불가능하다.
   */
  Set<String> set1 ={'c','b','a','a'};//(안드에선 에러 안나지만 vs에서는 에러)
  //안드에서는 지가 아예 빼버림
  // 초기값 에러. 버전따라 다름(특히 VS모드에서), 편집 프로그램에 따라 다름.
  //안드로이드 스튜디오, VScode 다름.

  //<String>으로 저장
  // Set<String> set1 = {'c','b','a'};
  print(set1);

  set1.add('a'); //추가되지 않는다.(에러는 안나는데 사실상 에러임)

  set1.add('d');
  print(set1);

  set1.remove('c');
  print(set1);

  //****값 존재 유무 체크가 목적 ****
  //contains() 는 존재하는 경우 true를 반환한다.
  var bCheck = set1.contains('b');
  if(bCheck){
    print("b는 존재하는 값입니다.");
  }

  //인덱스로 개별 값 점근(일반 for문) 단 List와 같은 방법이 아님에 유의
  for(int i=0; i<set1.length; i++){
    print('set1[$i] -> ${set1.elementAt(i)}');
  }

  for(dynamic each in set1){
    print(each);
  }

  //스프레드 연산자(...)
  var set2 = {...set1,'x','y','z'};
  print(set2);

}