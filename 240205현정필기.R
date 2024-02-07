library(dplyr)


## 파일의 경로
## 1. 절대 경로
##  - 절대적인 주소 값
##  -  환경이 변하더라도 같은 위치를 지정
##  - ex. c:/users/admin/document/a.txt, https://www.google.com

## 2. 상대 경로 
##  - 상대적인 주소 값
##  - 환경이 변함에 따라 위치도 변함
##  -(1) ./ : 현재 작업중인 디렉토리(폴더), ./파일의 위치
##  -(2) ../ : 현재 디렉토리에서 상위 디렉토리로 이동한다
##  -(3) 폴더명/ : 하위 디렉토리(폴더명)로 이동

### 상대경로를 더 많이 쓴다. 

## 외부의 데이터 파일 로드를 해보자
## csv 파일 로드 -> read. csv(파일의 경로)

## 상대 경로 사용
## 현재 디렉토리에서 상위 디렉토리 이동 (../)
## csv 라는 하위 디렉토리 이동 (csv/)
## example.csv

df <- read.csv('../csv/example.csv')
df


## 절대 경로 사용
df2 <- read.csv("C:/Users/현정/Desktop/10기/R___WORKING DIRECTORY/csv")
////## 에러뜸


## 파이프 연산자
## %>% : ctral(command) + shift + M 단축키
## 왼쪽에 있는 데잍터를 오른쪽의 함수에 대입
## head(데이터프레임명, 개수): 데이터 프레임 상위 n개 값을 출력
head(df,3)
######에러뜸
df %>% head(3)  
  
## 인덱스의 조건식으로 필터링
## filter(조건식)
df %>% filter(Gender == 'male')

## base 함수로 필터링 
## 조건식을 생성
df$Gender == 'male' -> flag
df[flag, ]


## 특정 컬럼의 데이터만 출력
## 패키지 사용
df %>% select('Name', 'Phone')
df %>% select(-Gender)


# Base
df$Name
df[c('Name', 'Phone')]
df %>% 
  filter(Gender == 'male') %>% 
  select(Name, Phone)
#성별이 남자인 사람들의 이름과 휴대전화번호

##Base
df$Gender == 'male' ->flag
df[flag,c('Name','Phone')]

exam <- read.csv("../csv/csv_exam.csv")
exam

## 차순 정렬 변경 (오름차순 / 내림차순)
## 수학 성적을 기준으로 오름차순 정렬

exam %>% arrange(math)
# arrange를 사용해 오름차순 정렬로 바꾸었다!

## 수학성적을 기준으로 내림차순 정렬
exam %>% arrange(desc(math))
exam %>% arrange(-math)

## Base
order(exam$math) -> flag2
# 수학성적을 가지고 가장 낮은 인덱스가 9번, 그 다음은 5번~~~

exam[flag2,]

##base 내림차순
order(exam$math, decreasing = TRUE) ->flag3
exam[flag3,]



## 정렬 방식의 조건이 2개 이상인 경우
## 학년 별로 내림차순 정렬 -> 수학 성적은 오름차순
exam %>% 
  arrange(desc(class),math)
#오름차순이면 그냥 desc빼면 됨

### 그룹화 연산(같은 데이터들끼리 그룹화시킨다) )_ Groupby , summerize
## class 별 수학, 과학, 영어의 평균 점수를 출력

exam %>% 
  group_by(class) %>% 
  summarise(
    mean_math = mean(math),
    mean_english = mean(english),
    mean_science = mean(science)
  )


## 데이터프레임의 결합
## 행을 결합 -> 유니언 결합
## 열을 결합 -> 조인 결합

## 유니언 결합 (단순한 행의 결합)
df_1 <- data.frame(
  id = 1:5,
  score = c(70,80,65,80,90)
)
df_2<- data.frame(
  id = 3:6,
  weight = c(60,50,70,80)
)

## 행 결합 함수( rbind() : 데이터 프레임의 구조가 같은 데이터 결합 )
rbind(df_1, df_2)
## 애러가 발생한다. 데이터의 구조가 다르기 때문이다 socre, wieght가 다름

df_3 <- data.frame(
  id = 3:8,
  score = c(50,70,80,70,90,50)
)
rbind(df_1,df_3)
## 데이터의 구조가 같아 정상적으로 합쳐짐

## 행과 결합하는 함수 -> bind rows
## 데이터의 구조가 다르더라도 합쳐 줌

##bind_rows() : 데이터의 구조와 상관없이 데이터를 결합

bind_rows(df_1,df_2)
bind_rows(df_1,df_2,df_3)

## 조인결합
## 특정한 조건이 참인 경우 컬럼의 데이터를 추가
##1.이너,2.레프트3.라이트4.풀
df_4 <- data.frame(
  id=c('test','test2','test3','test4'),
  item = c('A','B','B','D')
)

df_5 <- data.frame(
  item = c('A','B','C'),
  price = c(1000,2000,3000)
)

#inner_join() :  두개의 데이터 프레임에서 
##모두 가진 데이터만 결합하여 출력

inner_join(df_4, df_5, by = 'item')
### left_join() : 왼쪽 데이터프레임을 기준으로 결합
left_join(df_4, df_5, by='item')

right_join(df_4, df_5, by='item')
full_join(df_4, df_5, by='item')

install.packages('ggplot2')
library(ggplot2)

## ggplot2 패키지 안에 샘플데이터 로드

midwest <- ggplot2::midwest

head(midwest,3)
str(midwest)

## 데이터프레임을 뷰어창에서 확인하는 법
View(midwest)


## 컬럼의 이름을 변경
## rename(데이터프레임명, 새컬럼명 = 변경할 컬럼 명)
##popasian컬럼을 asian
##poptotal컬럼을 total
rename(midwest, asian = popasian) -> midwest
rename(midwest, total = poptotal) -> midwest

# 복사본을 생성(midwest에서 county, asian, total 데이터만 추출하여 저장)
# 추출 먼저
#Base
## 컬럼의 3개만 추출
midwest[c('county','asian','total')]

midwest %>% 
  select(county, asian, total) -> df

## 전체 인구수 대비 아시안 인구 비율이라는 컬럼을 생성
## 컬럼의 이름은 ratio라고 지정
## 전체 인구수 대비 아시안 인구수
## (아시아 인구수 / 전체 인구수) * 100 = ratio

## 벡터 데이터를 이용하여 아시아 인구비율을 생성
(df$asian / df$total)*100 ->ratio

##cbind()
## bindcole()
##df$ratio<-ratio
##data.frame(_,_)

bind_cols(df, ratio = ratio)
cbind(df, ratio)
data.frame(df,ratio)
df$ratio <- ratio
df


#패키지 이요해서 파생변수 추가
df2<- midwest[c('county','asian','total')]
## mutate () : 파생변수 생성 함수
df2 %>% 
  mutate(ratio = (asian/total)*100)  ->df

## 히스토그램 생성
## hist(벡터데이터)
hist(df$ratio)
##결과는 뷰어창에 나온다

## 전체 ratio의 평균 값을 출력
## mean을 통해 ratio의 평균값을 구하라

mean(df$ratio) -> mean_ratio

## mean_ratio와 ratio데이터를 비교하여
## 평균 값보다 높은 경우 large
## 평균 값보다 이하인 경우 small
## group 컬럼명에 데이터를 추가
midwest >= mean_ratio ->flag5
popasian$flag5

number(mean_ratio)

mean_ratio>=(0.4872)
mean_ratio<=(0.4872)


df
mean(df$ratio) ->flag55
df$ratio>flag55
##평균보다 큰 경우
##


##정답은?!?!

df$ratio >mean_ratio
##ifelse 사용 (조건식, 참일 경우 데이터, 거짓인 경우 데이터)

ifelse(flag5, 'large', 'small') -> group_data
df$group = group_data

## 패키지 이용하여 컬럼을 추가
## df로 데이터프레임이 기준이 됨
df %>% 
  mutate(group = ifselse(ratio > mean_ratio), large, small) ->df

# table 함수로 벡터를 선택하면 small, large 갯수 출력해줄 것

table(df$group)



#######

midwest <- ggplot2::midwest


## midwest 데이터에서 데이터 정제

## 컬럼의 이름을 변경
## popault컬럼을 adult 변경
## poptotal컬럼을 total 변경
## county, adult, total 컬럼만 따로 추출하여 변수에 저장
## "전체 인구수 대비 미성년자의 인구 비율"



rename(midwest, adults = popadults) ->midwest
rename(midwest, total = poptotal)-> midwest




midwest %>% 
  select(county, adults, total)-> df

View(df)


##어른인구비율 생성

(midwest$adults / midwest$total)*100 ->ratio
ratio

(100-ratio)-> child_ratio


cbind(df, child_ratio)





cbind(flag77, midwest)

rename(midwest, child_ratio = flag77)

cbind(ratio, df) -> df

str(df)

df %>% select(child_ratio, county)



##교수님 정답



rename(midwest, adult = popadults)

## county, adult, total 컬럼만 따로 추출하여 변수
df <- midwest[c('county', 'adult', 'total')]
## child 컬럼 추가하여 total - adult 데이터를 추가한다


df$total - df$adult -> df$child
head(df,2)

##child_ratio 컬럼을 추가하여 child / total * 100 데이터를 추가
(df$child / df$total) * 100 -> df$child_ratio

order(df$child_ratio, decreasing = TRUE) -> flag
df[flag,] ->df
head(df,5)

#### 
## 파이프로 한번에 연결 쭉 할 수 있음, 변수의 조작이 필요없음
## 원문데이터 유지한 상태로 데이터 정제가 가능

midwest <-ggplot2::midwest
midwest %>% 
  rename(adults = popadults, total = poptotal) %>% 
  select(county, adults, total) %>% 
  mutate(child = total - adults,
         child_ratio = child/total*100) %>% 
  arrange(desc(child_ratio)) %>% 
  head(5)


