# 매개변수가 존재하지 않는 함수를 생성
func_1 <- function(){
  print('hello R')
}
# 생성된 함수를 호출
func_1()
func_2 <- function(){
  return ('hello R')
}
func_2()
#이건 돌려주는것
result1<- func_1()
result2<- func_2()
print(result1)

#매개변수가 존재하는 함수 생성
func_3 <- function(input_x ,input_y){
 result= input_x + input_y
 print(result)
}
result3 = func_3(10,3)

# 변수의 종류
# 전역 변수
#   함수 내부나 외부 어디서든 사용이 가능한 변수

# 지역변수
#   함수 내부에서 생성된 변수들은 함수 내부에서만 사용 가능
#   함수의 외부에서 지역 변수를 호출하면 호출되지 않음
#   휘발성 변수라고 부르기도 한다

print(result)
#?# 이거 나오면 안되는데 왜 헬로우 알 뜨지?
#   함수를 생성할 때 인자(입력값) 값이 저장되는 공간
#   지역변수와 마찬가지로 함수 내부에서만 사용이 가능

#매개변수의 개수와 인자의 개수를 다르게 호출하는 경우
func_3(10)
#입력값은 두개인데, 10 하나면 넣어서 그럼. 만약 세개를 넣는다면?
func_3(10,3,2)
#공간이 두개밖에 없는데 3개를 넣었다


# 인자 개수가 가변인 경우의 함수를 생성
func_4 <- function(...){
  print(c(...))
}
func_4()
# null 값이 존재하지 않는다고 뜸.
func_4(1,2,3,4)
func_4(1,2,3,4,5,6,7,8,9,10)

# 함수를 이용해서 커스텀 연산자 생성
# 변수의 이름이 좀 독특
'%s%'<- function(input_x,input_y){
  result <- input_x ^ input_y
  return(result)
}

10 %s% 5
# 10의 5승
# 해당하는 연산자 앞이 첫번째 매개변수에 들어가고, 5는 y에 들어감
# 인자값을 어떻게 넣느냐의 차이이다
# 연산자의 형태로 사용할 수 있다

# 매개변수에 기본값을 설정하여 함수를 생성
func_5 <- function(input_x,input_y=2,input_z=3){
  result <- input_x + input_y - input_z
  return (result)
}
func_5(5,10,3)
# 5+10-3 = 5
func_5(5)
# 기본값인 2,3을 그대로 사용하여 답은 4가 나옴


# func_5(5,10,3) 호출
# -> input_x = 5, iniput_y = 10, input_z = 3
# -> result = 5 + 10 - 3
# -> return (12)
# func_5(5) 호출
# -> input_x = 5, input_y = 2, input_z = 3
# -> result = 5 + 2 -3
# ->return (4)
func_5(10, input_z = 1)
#세번째 z매개변수만 바꾸고 싶다면? input_z = ## 입력

# 매개변수가 2개인 함수를 생성
# 매개변수 사이의 값들을 모두 합하여 되돌려주는 함수를 생성
func_6 <- function(start, end){
  #시작부터 끝
  # start부터 end까지 합
  # 1~10의 합은 for문을 사용하여 반복문 생성
  # for ->1~10 / 범위지정
  # while을 사용한다면 -> i=1
  # i= i+1
  ## 그리고 누적합이 나올 공간을 만들어줌
  ## result = 0
  ## for 
  # 누적합을 할수있는 데이터의 공간생성(변수생성)
  result = 0
  #start부터 end까지 반복을 하는 반복문을 생성
  for (i in start:end){
    # i에 대입되는 데이터는 -> 벡터데이터의 각 원소들이 하나씩 대입하여 반복실행하는 부분이다
    # result의 누적합을 실행
    result = result + i
  }
  return(result)
}
# i는 지역변수이다. 오브젝트 뷰 보면 i라는 변수 안 만들어져있음
# i는 함수 안에서 생성됨
# 그래서 i 는 함수내부에서 생성되는 내부변수임

func_6(1,10)
# 1부터 10까지의 합이 나온다

1 :10
10:1

func_6(1,100)

min(5,3,8,1,10)
# 이 중 제일 작은 값 하나 보여줄 것임
max(10,3,6,11,8)
# 이 중 제일 큰 값 하나 보여줄 것임

min(10,8,15,6,11)
# 앞에서부터 양옆을 계속 비교

## 함수를 생성
## 매개변수는 2개 생성
## 첫번재 매개변수는 데이터 하나를 저장
## 두번째 매개변수는 인자의 개수가 가변인 경우
func_8 <- function(val, ...){
  # 최소값을 되돌려주는 함수 
  result <- val
  #result와 두번째 입력값을 비교하여 
  #작은 값을 result에 넣어준다
    for (i in c(...)){
    if (result > i){
    result <- i
    }
  }
  return(result)
}
func_8(3,4)
func_8(10,2,5,1,7)
# func_8(10,2,5,1,7) 호출
# -> val = 10, ... = 2,5,1,7
# -> result = 10
# -> for (i in c(2,5,1,7))
# -> 첫번재 반복
#   -> i = 2
#   -> if (10 > 2)
#   -> 조건식이 참이므로 -> result = 2
# -> 반복실행할 것이 끝남, 두번째 반복으로 넘어감
#   -> i =5
#   -> if ( 2 > 5 )
#   -> 조건식이 거짓 -> 아무 행동도 하지 않는다
# -> 세번째 반복으로 넘어간다
#   -> i = 1`
#   -> if (2 > 1)
#   -> 조건식이 참 -> result = 1
# -> 네번째 반복
#   -> i= 7
#   -> if (1>7)
#   -> 조건식이 거짓 - 아무 행동도 하지 않는다 
# 반복문이 종료
# return(1) / 결과값 1이 출력

# 평균을 구하는 함수 생성
# 매개변수가 가변인 함수 생성
  # 인자 값들을 모두 더한다.(반복문 사용)
  # 합계 라는 초기 데이터를 생성하여 0을 대입
  # 인자들을 벡터 데이터로 변환
  # 반복문을 이용하여 모든 데이터를 누적합
  # 합계에 인자의 개수로 나눠준다.
  # 결과를 되돌려 준다.

func_9 <- function(...){
  
  result = 0
  
  for (i in c(...)){
    
    result = result + i
  } 
  return(result)
}

# 여기 인자개수로 나누기만 하면 됨
##fun_9에 대한 교수님 답

func_10 <- function(...){
  result = 0
  cnt = 0
  for (i in c(...)){
    print(i)
    result = result + i
    cnt = cnt + 1
  }
  avg_result = result / cnt
  return (avg_result)  
}

func_10(5,3,4)
# 합계를 구하는 부분까지 도달
# 평균을 구하려면 인자의 개수만큼 나눠준다
# 해당하는 반복문은 벡터의 갯수만큼 실행되고있음

sum(5,3,2)
length (c(3,2,1))
func_11 <- function(...){
  result = sum(...) / length(c(...))
#합을 길이만큼 나눠준다는 뜻
    return (result)
}
func_10(5,3,1)

sum()
# 0이 나온다
length()
# 반드시 인자가 필요하다

# 인자는 가변으로 되어있을 것이다
test_sum <- function(...){
  result = 0
  for (i in c(...)){
    result = result + i
  }
  return(result)
}
test_sum(5,3,1)
test_sum()
# sum은 아무런 값이 없으면 그냥 0이라는 값을 받는다
# length가 벡터 데이터를 받는다는 것은?

test_len <- function(value){
  #길이는 cnt
  cnt = 0
  for (i in value){
    cnt = cnt + 1
  }
  return (cnt)
}
test_len(c(1,5,3))
test_len()  

## 데이터 프레임
## 벡터데이터들을 이요하여 데이터프레임 생성
name <- c('A','B','C','D','E')
grade <- c(1,3,2,2,1)
data.frame(name, grade) -> student
# 확인하는 작업을 한 것
# 변수를 만들어서 저장한다
# 해당하는 변수들을 student에 저장하겠다
# 결과가 안나온다는 것은 어딘가에 잘 저장된것


## 행렬 생성
## cbind() : 열을 추가하는 함수
midterm <- c(70,80,75,60,90)
final<- c(80,90,70,75,85)
## 같은 길이를 가진 두개의 벡터를 만들어놓고 cbind로 결합
score <- cbind(midterm, final)
## 행렬과 데이터프레임을 결합
data.frame(student, score)
cbind(student, score)
#둘 다 똑같이 데이터 프레임으로 만들어짐

##벡터데이터를 생성
gender = c('M','F','F','M','F')

##데이터프레임과 벡터 데이터와 행렬을 결합
data.frame(student, gender, score)
cbind(student, gender, score) -> students

test_vec = c(1,2,3,4)
# 길이가 다른 벡터데이터를 결합
cbind(students, test_vec)
data.frame(students, test_vec)

# 파생변수를 생성
# 데이터프레임에서 새로운 컬럼을 추가
# 기존에 있는 데이터에서 분석에서 사용할 데이터가 존재하지 않을 때
#사용할 데이터가 존재하지 않을 때
# 데이터들을 가공하여 새로운 데이터를 생성


students
# 기존에 생성했던 벡터데이터들의 합
midterm + final 
# 데이터프레임에서 특정 컬럼을 선택하여 합
students$midterm + students[['final']] -> total
# 벡터의 형태로 나옴
# 대괄호 쓸 때는 ''표시 필

# cbind(), data.frame() 함수를 이용하여 파생변수 생성
cbind(students, total)
data.frame(students, total)

##한줄요약 하고싶다면

students$total
# 위에서 합쳤는데 왜 null이 나올까?
# 확인만 하고 저장하지 않아서
# 대입연산자 화살표 
students$total <- students$midterm+final
# 출력이 나오지않았다는건 뭔가의 데이터가 변경이 되었다는 것
students

### students에 파생변수를 생성
### 평균성적을 생성
### 컬럼의 이름은 mean

total / 2 ->mean
cbind(mean, students) ->students
students

#벡터를 숫자로 나누면 벡터가 나온다. 왼쪽이 기준 데이터이다.

# total 컬럼의 데이터만 추출
students$total / 2 -> mean
# 해당하는 벡터데이터를 2로 모든 원소를 한번씩 나누어 준다. 
students$total / c(2,2,2,2,2)
# 똑같은 결과

data.frame(students, mean)

students$mean_1 <- (students$midterm + students$final)
students
#???

# 새로운 학생 정보를 추가 (5명 ->6명)
data.frame(name='F',grade=1, gender='M', midterm=80 ,final=70, total=150, mean.1 =00, mean_1=75)-> new_student
# 데이터프레임 행을 추가
rbind(students, new_student)
# mean_1

#리스트형태 데이터
list_a = list(name='test', age= 20)
list_a$loc = 'seoul'
list_a

##리스트 데이터에서 value가 벡터 데이터인 경우
list_b = list(
  name = c('test','test2'),
  age = c(20,30)
  )
list_b  

##리스트 2차원 데이터에서 'test'문자열 추출하려면
## 리스트에서 key값을 이용하여 데이터를 추출
list_b$name[1]

list_b$name[1]

list_b['name']
#앞에 키 값이 그대로. 리스트 형태 그대로 있음, 2차원 형태그대로
list_b[['name']][1]


### 필터
### 데이터프레임명[행의조건, 열의조건]
students[1,]
students[c(1,3),]
## 학년이 1학년인 학생의 정보만 출력
students$grade==1 -> flag
students[flag, ]
!flag
# 1학년이 아닌 정보들만 보겠다
students[!flag, ]



### 열 삭제 어케
df[,,,,,,,-1]




## 행과 열의 조건식으로 모두 이용하여 데이터를 추출
## 여학생들의 중간, 기말 성적만 추출
## 여학생 -> 인덱스 조건식 (gender == 'F')
## 중간, 기말 성적 -> 컬럼 조건식 (midterm, final)

students$gender == 'F' ->flag2
students[flag2, ]
# 여기까지는 인덱스의 조건만 담은 플래그
# 벡터 데이터를 묶어서 

students[flag2, c('midterm','final')]


##전체 학생중 중간성적이 80점 이상이고
##기말 성적도 80이상인 학생 정보를 출력하라

students$midterm >=80 ->flag3
students[flag3, final>=80]

##교수님 답

students$midterm >= 80 ->flag4
students$final >= 80 ->flag5
# 두개 조건 모두 만족하는 식은?
students[flag4&flag5,]
#여기에서 콤마를 지워도 에러가 발생하진 않지만, 뜬끔없이 데이터가 만들어짐
flag3 & flag4
students


######
students[ ,-8] ->students
students[ ,-8] ->students

mean_1


## 데이터의 순서를 변경하는 함수

student[c('grade','name')]

## 인덱스의 순서를 변경
students[c(3,2,1,5,4),]

## 학년을 기준으로 오름차순 정렬
## order(): 벡터데이터의 데이터들을 오름차순 정렬 순위를 출력해줌

order(students$grade) ->flag6
students[flag6,]

## 기말 성적을 기준으로 해서 내림차순 정렬
## order() 함수에서 특정 매개변수의 인자 값을 TRUE로 변경하면 내림차순 정렬이 된다
order(students$final, decreasing = TRUE)
# order은 오름차순
# 내림차순 하고싶은데 decreasing = TRUE가 생각이 안난다면
# 앞에 마이너스를 붙여주면 숫자가 커질수록 낮은값이 됨

order(-students$final)
# 하지만 문자는 -로 내림차순 표시를 못 함


install.packages('dplyr')

#패키지 로드
library(dplyr)

# 컬럼의 이름을 변경
# rename(데이터프레임명, 새로운 컬럼의 이름 = 변경할 컬럼의 이름)

students
rename(students, mean_score = mean) ->students

##ifelse(조건식, 참인 경우 데이터 출력값, 거짓인경우 출력값)


##조건식을 이용하여 파생변수 생성

ifelse(
  students$mean_score >= 75,
  'pass',
  'fail'
) -> res
students$result<-res
students


## 75점 초과인 경우에는 pass
## 75점인 경우는 hold
## 75점 미만인 경우에는 fail
ifelse(
  students$mean_score > 75,
  'pass',
  ifelse(
    students$mean_score == 75, 
    'hold',
    'fail'
  )
)


