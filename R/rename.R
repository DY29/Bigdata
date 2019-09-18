# 데이터 분석 목표 : 한번 빌릴때 두시간, 빌릴때 마다 각 변수 고려하여 수요 예측
# -> 날씨 사용 패턴과 날씨 데이터를 결합해야 함.

# 중요 매개 변수 1. 날씨 2. 요일 3. 회원/비회원 사용자

## 데이터 분석 준비
# 패키지 설치 및 로드하기
install.packages("ggplot2")
install.packages("dplyr")
library("dplyr")
library("ggplot2")

# 데이터 불러오기(count 데이터셋이 있어서 선택)
bike<-read.csv("D:\\dataset\\bike\\train.csv")

# 데이터 검토하기
head(bike,3)
tail(bike)
dim(bike)
names(bike)
View(bike)
str(bike)
summary(bike)

# 1단계. 변수 검토 및 전처리
# 변수 검토하기
# class 함수 : 변수의 타입 확인하는 함수. 

class(bike$datetime)
table(bike$datetime)

class(bike$season)
table(bike$season)

class(bike$holiday)
table(bike$holiday)

class(bike$workingday)
table(bike$workingday)

class(bike$weather)
table(bike$weather)

class(bike$temp)
table(bike$temp)

class(bike$atemp)
table(bike$atemp)

class(bike$humidity)
table(bike$humidity)

class(bike$windspeed)
table(bike$windspeed)

class(bike$casual)
table(bike$casual)

class(bike$registered)
table(bike$registered)

class(bike$count)
table(bike$count)

# 데이터 전처리 - 결측치 없어서 처리 안해줘도 된다

# 2단계. 변수간 관계 분석 
# 2-1.날짜별 자전거 렌트 횟수

group_month <- bike %>% group_by(month) %>% summarise(count = n())
ggplot(data = bike, aes(x= datetime, y = count)) + geom_col()

# 2-3.계절별 자전거 렌트 횟수
group_weath <- bike %>% group_by(season) %>% summarise(count = n())
group_weath
ggplot(data = bike, aes(x= season, y = count)) + geom_col()
# =>가을에 렌트수 제일 많다!

# 2-4.휴일 렌트 횟수
group_holi <- bike %>% group_by(holiday) %>% summarise(count = n())
group_holi
ggplot(data = bike, aes(x= holiday, y = count)) + geom_col()
# =>평일에 훨씬 더 많이 빌린다!

# 2-5.평일 렌트 횟수
group_work <- bike %>% group_by(workingday) %>% summarise(count = n())
group_work
ggplot(data = bike, aes(x= workingday, y = count)) + geom_col()
# =>평일에 훨씬 더 많이 빌린다!


# 2-6.날씨별 렌트 횟수
group_weather <- bike %>% group_by(weather) %>% summarise(count = n())
group_weather
ggplot(data = bike, aes(x= weather, y = count)) + geom_col()

# 2-7.온도별 렌트 횟수(온도 구간별 나눠 차트화)
# 온도는 요약 변수라서 summary()로 요약 통계량 확인
summary(bike$temp)
group_temp <- bike %>% group_by(temp) %>% summarise(count = n())
group_temp
ggplot(data = bike, aes(x= temp, y = count)) + geom_col() + xlim(0,41)

# 2-8.체감 온도별 렌트 횟수( 체감 온도별로 렌트 횟수가 훅 떨어지는 구간 있을수 있음)
summary(bike$atemp)
ggplot(data = bike, aes(x= atemp, y = count)) + geom_col() + xlim(0,50)

# 2-9.습도별 렌트 횟수
summary(bike$humidity)
ggplot(data = bike, aes(x= humidity, y = count)) + geom_col() + xlim(0,100)

# 2-10.풍속별 렌트 횟수
summary(bike$windspeed)
ggplot(data = bike, aes(x= windspeed, y = count)) + geom_col() + xlim(0,60)

# 2-11.비회원 렌트 횟수
summary(bike$casual)
ggplot(data = bike, aes(x= casual, y = count)) + geom_col() + xlim(0,400)
#=> 낮시간대에 많이 사용

# 2-12.회원 렌트 횟수
summary(bike$registered)
ggplot(data = bike, aes(x= registered, y = count)) + geom_col() + xlim(0,900)
#=> 출퇴근 시간에 많이 사용

# 3.파생변수 만들어서 상관관계 만들기
# 년
year<-substr(bike$datetime,1,4)
# 월
month<-substr(bike$datetime,6,7)
# 시간
time<-substr(bike$datetime,12,13)
# 평일
weekday <- bike%>% filter(workingday == 1)
tail(weekday,10)
ggplot(data=bike,aes(x=weekend,y=count))+geom_col()

# 휴일
weekend <- bike%>% filter(workingday == 0)
tail(weekend,10)


# 추가할 거 : 평일/ 휴일 나눠서 회원/비회원 이용 횟수 추가


head(bike, 10)
