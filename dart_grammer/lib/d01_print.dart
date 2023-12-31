/*
  다트언어의 출발점(Entry Point)은 메인 메서드이다.
  플러터는 역시 여기부터 시작됩니다.
 */
void main(){

  print('안녕하세요'); //문자열 표현시 더블쿼테이션(쌍따옴표)도 가능
  print("Hello"); //싱글 쿼테이션 (홀따옴표)도 가능

  int num = 1;
  print(num);
  //변수의 값을 문자열과 같이 출력할때는 $변수 와 같이 사용한다.
  print('num의 값은 $num 입니다.');

  //수식이 있는 경우 ${수식} 과 같이 사용한다.
  print('1+2=${1+2 }');
}