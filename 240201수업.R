#주석
->해당하는 코드에 대한 설명하는 부분
테스트형 코드들이 정상적으로 실행되고 있는지 체크하는 코드에 넣어볼 것인데
해당하는 코드가 정상적으로 실행이 된다면 출력코드, 로그코드를 지우지않고 주석처리 해둠
주석은 실행되지않음. 설명하는 부분
테스트용 코드를 그냥 두는 이유, 수정할 때 확인하기 편하기 때문

#변수를 생성
a <- 10
ctl+enter
여기는 스크립트 에디터임
밑에 코드가 들어감
오른쪽에도 생성됨
print(a)
b = "test"
print(b)
TRUE -> c
print(c)

d <- c(1,2,3,4,5)
e <- c('test1','test2','test3')

print(d)
print(e)
e
f <- 1:10

print(d[1])




# 행렬 데이터 생성
# 2차원 데이터


arr_x = array(1:20, dim=c(4, 5))
print(arr_x)

arr_y = array(1:20, dim=c(4, 4))
print(arr_y)
#1~16까지만나옴
arr_z = array(1:20, dim=c(4, 6))
print(arr_z)

a = "test"
print(a)

기존의a가 있어도
새로 만든다면
기존의 식은 없어짐

print(a)

a = "test"
print(a)

# 히스트 형태의 데이터 생성
# 벡터 데이터에서 index위치 값 대신에 key 값을 지정
# 벡터 데이터에서 순서대로 데이터를 나열해야되는 데이터
# 리스트 데이터는 순서와 상관없이 key값을
# 기준으로 데이터를 출력 가능
# 통신은 대부분 key값으로
# list가 key value의 형태


list_a = list(name = 'test', age = 20, phone = '01012345678')
#key값은 위치의 값이다
print(a)
print(list_a)
#위치대신에 사용하는것이 해당하는 key값들이다
print(list_a['name'])

b = c('test', 20, '01012345678')
print(b[1])

# 1을 쓸거냐 name을 쓸거냐의 차이이다
# 벡터데이터와 리스트의 차이는 위치의 값을 쓸 것이냐 key(문자)값을 지정할것이냐
# 데이터 프레임은 특별한 t값을 지정하는 것

# 데이터프레임 생성
# 2차원 데이터 생성하는 과정
# 인덱스와 컬럼을 기준으로 데이터를 생성
df = data.frame(
  name = c('test1','test2', 'test3'),
  age = c(20, 30, 40),
  phone = c('01011116666','01022225555','01033334444')
)
print(df)

#벡터의 개수를 다르게 데이터프레임을 생성
df2 = data.frame(
  name = c('test1', 'test2', 'test3'),
  age = c(20,30)
)
#low의 갯수가 맞지않는다는 에러가 발생할 것이다


# 연산자
# 산술연산자
x <- 10
y <- 3
print(x + y)
x - y ->result
# 객체를 찾을 수 없을 때는 한번 더 엔터를 누르기
# result 연산 후 결과가 만족스럽다면 해당하는 값을 다른 변수에 담아주는 것
# 실행결과가 없다는 것은 result가 적용이 됐다는 것

print(x / y)
print(x ^ y)
print(x %% y)
print(x %/% y)

# 비교연산자
# 두개의 데이터를 비교하여 결과 값을 논리값(참/거짓)으로 출력
# 비교연산자를 사용하면 참/거짓만 나오니 2개 중 하나 

z <- 5
print(x == y)
print(y != z)
print(x > y)
print(x< z)
#부등호를 먼저써야함  <= >=

#논리연산자
#부정_자주상용함
print(!TRUE)
# AND_두개의 논리값들이 모두 참인 경우에만 출력
# 그 외의 경우는 모두 거짓 출력
print(TRUE & FALSE)
# OR_
# 두개의 논리값 중 하나만 참이여도 참을 출력
# 두개의 논리값이 모두 거짓인 경우에만 거짓을 출력
print(TRUE | TRUE)
print(TRUE | TRUE)

# 두개의 조건 중 하나만 맞으면 된다면 OR 연산자를 사용한다
# 뒤의 제어문 조건식에 해당하는 비교연산자들을 많이 사용하게 될 것



#조건문 (if문)
x <- 3
if(x > 5){
  print('x는 5보다 크다')
}
#해당하는 조건식이 거짓이므로 print를 해주지 않음

#if ~ else문
#if 조건식이 참인경우 실행할 코드와
#else 문에서 조건식이 거짓인 경우 실행 할 코드를 작성
if (x>5){
  print('x는 5보다 크다')
}else{
  print('x는 5보다 작거나 같다')
}
#조건식이 여러개라면?
#학점으로 생각해보자
#조건이 여러 개인 조건문을 생성
score <- 95
if (score >= 90){
  #score가 90점 이상인 경우
  print('A')
}else if(score >= 80){
  #score가 90점 미만이고 80점 이상인 경우
  print('B')
}else if (socre>=70){
  #score가 80점 미만이고 70점 이상인 경우
  print('c')
}else{
  # score가 70점 미만인 경우
  print('F')
}

score<-95

print('F')

#console 라인에 ctrl+c하면 새로 시작됨
#이 환경을 커맨드라인이라 하는데 이런 커맨드 라인에서는 그냥 종료이다

#강제적으로 데이터의 형태에 변화를 준다
#컴퓨터는 이진수로 표현된다
#참=1 거짓=0도 숫자로 표현가능
#0이 아닌 숫자가 나온다면 

g <- 1
if (g){
  print('test')
}

#로그인시에 아이디와 패스워드 두개의 조건식이 모두 참인 경우 and를 사용

#if조건식에 조건식이 2개 이상인 경우
id <- 'test'
pass <-'1111'

# 하나의 조건식 안에 두개의 조건식이 모두 참일때
if (id =='test' &  pass== '1234'){
  print('로그인 성공')
}else{
  print('로그인 실패')
}

#which문
#벡데이터에서 조건식이 일치하는 데이터의 위치 값을 출력
name <- c('test','test2','test3')

which(name == 'test2')
#if문을 써서 나오게 하는 방법은 무엇일까?

# test2를 다른 값들과 비교하고 which문과 같은지 물어볼 것임

if(name[1] == 'test2'){
  print(1)
}
if (name[2] == 'test2'){
  print(2)
}
if (name[3] == 'test3'){
  print(3)
}

#which문을 모른다고해서 값을 못 구하는건 아니지만 번거롭다

#같지 않은지도 물어보자
which(name != 'test2')

#없다면?!
which(name == 'test5')
# integer(0) __해당하는 값이 존재하지 않는다

# 반복문 
# 벡터데이터를 중요하게 보면 됨
# for문
# 반복횟수가 지정되어있는 작업을 할 때 많이 사용
# for문이 빨리 만들어진다 하시는 강사님
# 벡터데이터의 원소 갯수만큼 반복 실행하는 구문
#while구문은 반복횟수가 정해지지 않은 경우에 많이 쓴다
#횟수가 정해지지 않은 반복문은 무엇일까?



array_a = 1:10
for (i in array_a){
  print(i)
}
# 정수형 데이터가 만들어지면 L이 붙음
# 1~10의 합, 누적합을 하려면 어떻게 해야할까?
# array값 말고 초기의 합계값을 구하여야 한다. 초기 합계값은 0으로 시작한다.
# 1부터 10까지의 합계를 출력
# 초기합계데이터를 0으로 지정

result <- 0
#1부터 10까지 반복을 하는 반복문을 생성
for (i in array_a){
  result = result + i 
# 첫번째 반복 : result = 0, i=1, result = 0+1 --> result = 1
# 두번째 반복 : result = 1, i=2, result = 1+2 --> result = 3  
# 세번째 반복 : result = 3, i=3, result = 3+3 --> result = 6
# 네번째 반복 : result = 4, i=4, result = 6+4 --> result = 10  
  }
print(result)

# 1~50합 5050
# 1~1000합 1001*500=5,005,000

# while문
# 초기 시작값을 지정하고 해당하는 값을 반복 실행할때마다 증감
# 조건식이 거짓이 될때 까지 반복 실행
i = 1
while (i <= 10){
  print(i)
  i = i + 1
} 
#while문을 이용하여 1부터 10까지의 합계를 출력
i = 1
#합계 초기값을 0을 대입
result = 0

while (i <= 10){
  i = i + 1
    # i의 값을 result에 누적합
  result = result + i
}
print(result)

# 순서를 바꾼다면 위에부터 다시 선언
# 코드는 순서도 중요하다, 라인별로 한줄한줄씩 실행이된다
# 증감식은 가장 마지막에 적어주는 것이 좋다, 하지만 자주 이걸 까먹는다, 무한반복이 된다.
# 무한반복되면 그냥 컴퓨터 전원을 꺼라

# 반복문을 만들면 예시로 구구단을 빼놓을 수 없다
# 구구단 만들기
# 2부터 9까지 반복을 하는 반복문을 생성
array_a = 2:9
array_b = 1:9

for (i in array_a){
  print(i)
  for (j in array_b){
  print(j)  
  }
}


## 반복문 문제
## 2개의 주사위를 굴려서
## 두 주사위의 합이 5의 배수인 경우의 수를 출력하시오

## 1부터 6까지 반복을 하는 반복문을 생성
## 1부터 6까지 반복을 하는 반복문을  생성
## 5의 배수인 조건문을 생성
## 조건식이 참인 경우 출력

array_a = 1:6
array_b = 1:6

if (a+b = 5*i)
  print('true')

#리트
for(i in 1:6)
  for(j in 1:6)
    
if (a+b = 5*i){
  print('true')  
}

#교수님 답
for(i in 1:6)
  for(j in 1:6)
    print(c(i,j))
#반복문이 완성되었다
#두 숫자의 합의 5의 배수인것은 어떻게 아는가
#반복문은 한번 중간에 끊어서 잘하고 있는지 확인해보자
    #    if(res %% 5==0) 위의 식과 같음
        
res = i + j
if (res %%5==0){
cnt = cnt + 1
  }
print(cnt)

    
    
    #산술연산자의 우선순위는 일반적인 사칙연산이 먼저되니 괄호를 꼭 달자    
    


# break문
# 반복문을 강제로 종료
for (i in 1:100){
  if( i>3) {
    break
  }
  print(i)
}

for (i in 1:100){
  print(i)
  if (i >3){break
    }
}

##1부터 100까지의 누적합중에 누적합의 값이 2000이 넘어가는 부분에 숫자는 몇일까?
## 그 합계는 몇일까?
#누적합을 먼저 만들어보자

#초기값 만들기
result=0
#반복문을 사용한다
for ( i in 1 : 100){
  result = result + i
  if (result >= 2000){
    break
  }
  }
print (c(i,result))


result=0
#반복문을 사용한다
for ( i in 1 : 100){
  if (result >= 2000){
    break
  }
  result = result + i
}
print (c(i,result))

## 1부터 1씩 증가시킨 데이터를 누적합을 하는 도중 
## 누적합이 5만이 넘어가는 최초의 순간은 언제인가?
i=1
result = 0
while (TRUE){
  result = result + i
  if (result >= 50000){
    break}
  i = i + 1
}
print(c(i,result))


i=1
result = 0
while (TRUE){
  result = result + i
  if (result >= 50000){
  break
  i = i + 1
    }}
  
print(c(i, result))



##1부터 100까지 숫자 중 짝수의 누적합을 출력하라

##합계라는 초기 값을 0을 대입하여 생성
##1부터 100까지 반복을 하는 반복문을 생성
##짝수인 경우 조건문을 생성
##조건식이 참인 경우 누적합을 실행
## 합계를 출력

res=i+j


result <-0
for (i in 100){
  if(i%%2==0){
    result = result + i}
}
print(result)





#더 효율적인 코드, 반복하는 횟수가 적다
result = 0
for (i in 1:50){
  result = result + (i*2)
}
print(result)




i = 1
result = 0

while (TRUE){
  if(i>=100){
    break
  if( i %% 2 == 0{
    result = result + i
  })
    i = i + 1
  #if문 밖에 i의 증가식을 적는게 좋음, 특히 result뒤에 넣으면 무한반복위험
}

  
i = 1
result = 0

while(TRUE){
  if (i > 100){
    break
  }
  result = result + i
  i = i + 2
}
print(result)  


#비순서형 벡터데이터를 이용한 for문
array_a = c('kim','park','lee')
for(i in array_a){
  print(i)
}

#위치데이터들을 i에 집어넣고 돌렸다

i<-1
while(i<=3){
  print(array_a[i])
  i=i+1
}


## next 문
## 반복문으로 되돌아 간다. 다음으로 넘어간다.
for (i in 1:10){
  if (i<5){
    next
  }
  print(i)
}

#반복은 5번 프린트는 6번

for (i in 1:10){
  print(i)
  #next가 의미가 없어짐
 
   if (i<5){
    next
     #코드를 실행하지않고 반복문으로 돌아가겠다
     #가장마지막에 적는 next는 의미가 없고 라인만 늘어난다. 불필요하다.
  }
}

##break는 마지막에 써도되지만 next는 마지막에 넣으면 의미가 없다


result = 0
for (i in 1:100){
  result = result + i
}
print(result)

#순서대로 좀 하기

##짝수의합계
result = 0
for (i in 1:100){
  if(
  i%%2==1){
    next
    }
  result = result + i
}
print(result)





