## ifelse 함수를 생성
## ifelse ( 조건식(벡터데이터), 참인경우의 값, 거짓인 경우 값)
## ifelse 함수의 결과 값의 데이터 타입 -> 벡터 데이터 
a <- c(TRUE, FALSE, TRUE, FALSE, FALSE)
ifelse(a, "T", "F")
#매개변수가 3개 있어야함

## ifelse 함수는 벡터 데이터를 리턴
## ifelse 함수 안에는 비어있는 벡터 데이터에 데이터를 추가하는 부분이 존재

## 벡터데이터에 데이터를 추가
result <- c()
##비어있는 벡터 데이터를 만들고
##1부터 10까지 반복을 하는 반복문을 생성
for (i in 1:10){
  print(i)
}
## 짝수의 값을 나오게 하려면 나머지값이 /2하면 0
## %%

for ( i in 1:10){
  if (i %% 2 == 0){
    result[length(result)+1] <- i
  }
}
result
## 첫번째 위치에 i 값을 넣고 


vector_a <- c(5,4,3,2,1)
## 벡터데이터에서 특정 위치의 데이터를 출력
vector_a[2]
## 대괄호는 위치의 값, 2번째 값 4가 나옴
vector_a[2] <-10
vector_a
## 두번째 위치에 10으로 바뀌어있음
vector_a[6]
## 없다고 나옴
vector_a[6] <- 11
vector_a
## 들어갔다!
length(vector_a)
##이 벡터의 길이는 6
result<- c()
#length 0
result[1]
result[1]<-2

result<- c() +1
##길이는 1이된다
##다시 추가해주면
result[2]
result[2] <-4

result<- c() +1

#####그래서 위의 식을 다시보면

for ( i in 1:10){
  if (i %% 2 == 0){
    result[length(result)+1] <- i
  }
}
result

##ifelse 함수를 생성
##매개변수를 3개
iftest <- function(vector_bool, t, f){
  ## 되돌려주는 데이터는 벡터데이터 -> 빈벡터 하나 생성
  result <-c()
  ## vector_bool의 데이터 타입은 벡터
  ## 벡터의 길이만큼 반복하는 반복문을 생성한다
  ## while문에서 사용할 초기값을 지정
  i <- 1
  ## while 조건식
  while ( i<= length(vector_bool)){
    ## i가 의미하는 것은?
    ## 1부터 벡터의 길이까지 반복
    ## 해당하는 벡터 데이터의 위치값
    ## vector_bool의 i번째 데이터가 참일 때 
    if(vector_bool[i]){
      ## result에 t라는 인자값(2번째 매개변수)을 추가한다
      ## i가 1,2,3,4~로 나올거라 그냥 i 넣음
      result[i] <- t
    }else{
      ##vector_bool의 i번째 데이터가 거짓인 경우
      ## result에 f인자값(3번째 매개변수)을 추가
      result[i] <- f
    } 
    i <- i +1
  } 
  return (result)
}
iftest(
  c(TRUE, TRUE, FALSE, FALSE),
  'T',
  'F'
)

## 결측치 데이터의 처리
c1 = c(1,2, NA, 4,5)
c2 = c(1,2,3,4,5)
c3 = c(NA,NA,3,4,5)

df= data.frame(c1,c2,c3)
df
## 결측치 존재 유무 (is 사용)
is.na(df)
## 해당하는 데이터가 결측치인가 아닌가를 보여준다
NA == NA
##결측치와 결측치가 같은가라고 물어보면 같지않다고 나온다

## 결측치의 개수 확인
## TRUE의 개수 확인
table(is.na(df))
## false 12개, true 3개 확인
## is.na 함수를 이용하여 데이터 필터링
is.na(df$c1) 
# c1이라는 벡터데이터 안에서 true false 확인
is.na(df$c1) -> flag
## flag는 인덱스의 조건이므로 콤마를 넣어준다
df[flag,]
df[!flag,]
## 결측치가 아닌 데이터 
## 결측치를 제거한다 (자주쓰는방법)
 
## 결측치가 포함된 컬럼 데이터는 연산이 제대로 이뤄지지않는다
mean(df$c1)
mean(df$c2)
min(df$c1)
max(df$c1)
max(df$c1, na.rm =T)

# 외부의 데이터 파일을 로드 (csv)
exam = read.csv("../csv/csv_exam.csv")
str(exam)
## 결측치의 개수를 확인
table(is.na(exam))
## 결측치를 강제로 입력
exam[c(2, 5), 'math' ] <- NA
table(is.na(exam))

exam$math
library(dplyr)

# 수학 성적에서 결측치를 제거하고 그룹화 연산
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))##결측치가 존재하기 때문에 na 존재

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math, na.rm = T))
#결측치를 제거하는 것(na.rm = T)

exam %>% 
  filter(!is.na(math)) %>%  #결측치인 데이터만 보겠다,!넣어줘서 na 빼고 본다는 것
  group_by(class) %>% 
  summarise(mean_math = mean(math))

## 결측치의 특정한 데이터를 대입
## ifelse()+is.na()
is.na(exam$math)
ifelse(is.na(exam$math), mean(exam$math, na.rm=T), exam$math)
ifelse(is.na(exam$math), 0, exam$math)

## 극단치
library(ggplot2)


mpg <- ggplot2::mpg
str(mpg)
View(mpg)
## 고속도로 연비 데이터에서 극단치를 확인
boxplot(mpg$hwy) $stats
## 결측치 확인
table(is.na(mpg))# 결측치는 존재하지 않음
table(is.na(mpg$hwy))

## 극단치인 데이터를 결측치로 대체한다
mpg$hwy < 12 | mpg$hwy > 37 -> flag
table(flag)

ifelse(flag, NA, mpg$hwy) -> mpg$hwy
table(is.na(mpg))
## 다시 얘를 mpg 데이터프레임 안에 있는 hwy안에 넣어야 한다.
## 컬럼의 데이터만 바꿔주고 있어서 데이터프레임에 그대로 넣는 실수를 많이 함
## 실행은 되지만 원했던 mpg는 벡터데이터로 나오게 될 것임

## 컬럼의 이름을 변경
## manufacturer -> 제조사
## hwy -> 고속도로
## cty> 시내
## class -> 차종
## drv -> 구동방식

mpg %>% 
  rename(
    제조사 = manufacturer,
    고속도로 = hwy,
    시내 = cty,
    차종 = class,
    구동방식 = drv
  ) -> mpg
## 제조사별 고속도로의 평균 연비가 어떠한 제조사가 가장 좋은가

# 제조사별 group_by
# 평균 mean -> summerize
# 제조사만 보기 select
# 가장 좋은 제조사 arrange 내림차순 정렬

## 컬럼을 제조사, 고속도로 선택
## 제조사로 그룹화를 한다
## 그룹화 연산은 고속도로의 평균값을 구함
## 평균연비 내림차순 정렬
## 상위 5개 출력
mpg %>% 
  select(제조사, 고속도로) %>% 
  group_by(제조사) %>% 
  summarise(평균연비 = mean(고속도로)) %>% 
  arrange(desc(평균연비)) %>% 
  head(5)

##과연 괜찮은가? 추가해보자
## 극단치, 결측치를 넣었었는데
## 실제 계산해서 평균값을 냈더니
## 결측치를 포함되어있는 평균은 결측치가 나와서 문제가 된다
## 해당 제조사는 랭킹에 들어가지 못 하는 것
## 신뢰할 수 있는 데이터가 아니다
## 그래서 결측치를 제거하는 것이다
## 평균에 넣거나, 필터링을 걸어서 결측치를 빼는 것

mpg %>% 
  select(제조사, 고속도로) %>% 
  group_by(제조사) %>% 
  summarise(평균연비 = mean(고속도로, na.rm=T)) %>% 
  arrange(desc(평균연비)) %>% 
  head(5)

mpg %>% 
  filter(!is.na(고속도로)) %>% 
  select(제조사, 고속도로) %>% 
  group_by(제조사) %>% 
  summarise(평균연비 = mean(고속도로)) %>% 
  arrange(desc(평균연비)) %>% 
  head(5)

### 데이터 시각화
### 그래프 표현
### 레이어를 하나씩 추가하여 그래프를 완성
## 배경 레이어 생성

ggplot(
  data = mpg,
  aes(
    x = displ,
    y = 고속도로
  )
) + geom_point() + xlim(3,6)
#그래프를 더 해줄 레이어 추가 + 

##막대 그래프
mpg %>% 
  group_by(구동방식) %>% 
  summarise(
    평균연비 = mean(
      고속도로, na.rm=T)) -> group_data

ggplot(
  data = group_data,
  aes(
    x = 구동방식,
    y = 평균연비
  )
) + geom_col()
## col x,y축의 데이타를 모두 가지고 있을 때 막대 그래프를 그려주는 것
## bar 는 빈도수를 막대그래프로 보여주는 것


ggplot(
  data = mpg,
  aes(
    x = 구동방식
  )
) + geom_bar()

## 제조년도별 생산 차랑의 개수 라인 파이프

table(mpg$year)

mpg %>% 
  group_by(year) %>% 
  summarise(count = n()) -> group_data2

ggplot(
  data = group_data2,
  aes(
    x = year,
    y = count
  )
) + geom_line()

ggplot(
  data = economics,
  aes(
    x = date,
    y = unemploy
  )
) + geom_line()
View(economics)  

mpg <- ggplot2::mpg
boxplot(mpg$hwy)  
ggplot(
  data = mpg,
  aes(
    x = drv, 
    y = hwy
  )
) + geom_boxplot()

## sav 파일을 로드
## foreign 라이브러리 설치

install.packages('foreign')
library(foreign)

welfare <- read.spss("../Koweps.sav",
          to.data.frame = T)
str(welfare)
View(welfare)




## 컬럼의 이름을 변경
welfare %>% 
  rename(
    gender = h10_g3,
    birth = h10_g4,
    income = p1002_8aq1, 
    code_job = h10_eco9
  ) -> welfare
## 특정 컬럼만 추출
welfare_copy <- welfare[c(
  'gender','birth','income','code_job')]

table(is.na(welfare_copy))
table(is.na(welfare_copy$gender))
table(is.na(welfare_copy$birth))
table(is.na(welfare_copy$income))
# income에 대한 결측치를 어떻게 줄일까?
# 등록하지 않는 수도 있지만 해당하는 데이터를 0으로 넣거나 제외를 시키면 된다

table(is.na(welfare_copy$code_job))

## 성별 데이터에서 이상치가 존재하는가?1,2,9 그 이외의 데이터는 존재하면 안됨
## table(gender) 빈도수확인 함수로 다른 수치가 있으면 이상치가 확인됨
## gender 컬럼의 데이터가 1이면 '`male`'
## 1이 아니라면 'female'
ifelse(
  welfare_copy$gender == 1,
  'male', 'female'
)-> welfare_copy$gender
table(welfare_copy$gender)

## welfare_copy 에 넣는거 아님
## welfare_copy$gender에 넣는거임

## income 컬럼의 데이터가 0, 9999 라면 NA 변환
## casel
## income 0보다 크고 9999보다 작은 경우

welfare_copy$income > 0 &
  welfare_copy$income < 9999 ->flag
ifelse(
  flag,
  welfare_copy$income,
  NA
)


## case2
## income 이 0이거나 9999라면
flag2 <-welfare_copy$income == 0 | welfare_copy$income == 9999
ifelse(
  flag2, 
  NA,
  welfare_copy$income
)

## case3
## income 이 (0,9999) 안에 포함되어 있으면
flag3 <- welfare_copy$income %in% c(0,9999)
ifelse(
  flag3,
  NA,
  welfare_copy$income
) -> welfare_copy$income

### 성별을 기준으로 평균 임금의 차이가 존자해는가?
# mean
# group_by
# filter ( mean 혹은 filter / 데이터 양이 많으면 필터가 좋음)
# select

welfare_copy %>% 
  filter(!is.na(income)) %>% 
  select(gender, income) %>% 
  group_by(gender) %>% 
  summarise(mean_income = mean(income)) ->gender_data
ggplot(
  data = gender_data,
  aes(
    x = gender,
    y = mean_income
  )
) + geom_col() 

## 나이에 따른 임금의 차이가 어느정도인가?
## 나이(age) 컬럼을 생성
## 데이터의 기준년도(2015) - birth  
## -> welfare_copy

## income이 결측치인 데이터를 제거
## age, income만 추출
## 평균 임금 그룹화 연산
## 바형 그래프로 표시


welfare_copy %>% 
  mutate(age = (2015 - birth)) ->welfare_copy 
welfare_copy %>% 
  filter(!is.na(income)) %>% 
  select(age, income) %>%
  group_by(age) %>% 
  group_by(mean(income)) ->gender_income_data
ggplot(
  data = gender_income_data,
  aes(
    x = age,
    y = income
  )
)+ geom_col() 


##교수풀이
# 1
welfare_copy %>% 
  mutate(age = 2015-birth) 
# 2
2015 - welfare_copy$birth -> welfare_copy$age
#나이라는 컬럼이 추가됨

welfare_copy %>% 
  filter(!is.na(income)) %>% 
  select(age, income) %>%
  group_by(age) %>% 
  summarise(mean_income = mean(income)) ->age_data
ggplot(
  data = age_data,
  aes(
    x = age,
    y = mean_income
  )
) + geom_col()

age_data %>% 
  arrange(desc(mean_income)
  ) %>% 
  head(5)

## 연령대별 평균임금 문제

## 연령대(ageg) 컬럼을 추가
## 나이가 40미만이라면 young
## 나이가 40이상 60미만이라면
## 나이가 60이상이라면 old 
## ageg, income컬럼을 따로 추출
## ageg을 기준으로 그룹화
## 평균 임금을 그룹화 연산(결측치를 제외)

## 바형 그래프로 표시

age

ifelse(welfare_copy$age > 40, 'young',
       ifelse(welfare_copy$age<60, 'middle',
              ifelse (welfare_copy$age>60, 'old', 0)
              )
      )
welfare_copy %>% 
  mutate(
    ageg = ifelse(
      age<40, 'young',
      ifelse(
        age<60, 'middle', 'old'
      )
    )
  )%>% 
  select(ageg, income)%>% 
  group_by(ageg)%>% 
  summarise(
    mean_income = mean(income, na.rm=T)
  ) -> ageg_data

##바형 그래프로 표시
ggplot(
  data = ageg_data,
  aes(
    x = ageg,
    y = mean_income
  )
) + geom_col() + scale_x_discrete(
  limits = c('young', 'middle', 'old')
)

## 엑셀의 자료를 어떻게 불러올까?
## excel 파일을 로드 사용할 패키지를 설치
install.packages('readxl')
library(readxl)
read_excel("../csv/Koweps_Codebook.xlsx")
# 두번째 시트를 불러오라
read_excel(
  "../csv/Koweps_Codebook.xlsx",sheet = 2) ->code_book

## join결합
## welfare_copy , code_book -> 기준 컬럼(code_job)
left_join_data <- left_join(
  welfare_copy,
  code_book,
  by='code_job'
)
str(left_join_data)
inner_join_data <- inner_join(
  welfare_copy,
  code_book,
  by='code_job'
)
str(inner_join_data)

welfare_copy %>% 
  filter(is.na(code_job)&!is.na(income))
#여기에는 직업은 존재하지만 임금이 없는 사람은 0명이다

welfare_copy %>% 
  filter(!is.na(code_job)&is.na(income))
# 직업은 없지만 임금이 많은 사람은 2709명


## 직업별 평균 임금이 높은 상위 5개

head(left_join_data,1)
left_join_data %>%
  filter(!is.na(income)) %>% 
  select(job, income) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income)) %>% 
  arrange(desc(mean_income)) %>% 
  head(5)
## 남성을 기준으로 
left_join_data %>%
  filter(!is.na(income)& gender=='male') %>% 
  select(job, income) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income)) %>% 
  arrange(desc(mean_income)) %>% 
  head(5)


q rvq+vr
## 여성을 기준으로
left_join_data %>%
  filter(!is.na(income)& gender=='female') %>% 
  select(job, income) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income)) %>% 
  arrange(desc(mean_income)) %>% 
  head(5)
  

## income 데이터의 결측치를 0으로 대체 
ifelse(
  is.na(left_join_data$income),
  0 ,
  left_join_data$income
) -> left_join_data$income
  

left_join_data %>% 
  filter(gender == 'female'&!is.na(job)) %>% 
  select(job, income) %>% 
  group_by(job) %>% 
  summerise(mean_income = mean(income)) %>% 
  arrange (-mean_income) %>% 
  head(5)

  








