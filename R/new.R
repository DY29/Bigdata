# 실습과제 5-1 내 프로젝트 만들기
print('str')
getwd()

print(1)
library(ggplot2)

mpg
names(mpg)

# sep : seperate
# date ; ~~ : 배경
# geom : 그래프 모양
# col & bar 차이 : 
# fill :: 색 채우기
# call : 외각 채우기
# 1단계
ggplot(data=mpg, aes(x=cyl, y= hwy)) 
  # 2단계 어떤 모양의 그래프를 그릴 것인가?
  ggplot(data=mpg, aes(x=cyl, y=hwy)) +
    geom_col() +ylim(0,3000) + xlim(4,8)
    # 3단계  - 축범위 지정
     
# 백인
midwest
names(midwest)
range(midwestSpopwhite)
head(midwest)
summary(midwest)
ggplot(data=midwest, aes(x=poptotal, y=popwhite)) +
  geom_point() +ylim(0,80000) + xlim(0,500000)

# 아시안
ggplot(data=midwest, aes(x=poptotal)) +
  geom_histogram() +ylim(0,80000) + xlim(0,500000)+
    # 타이틀
      ggtitle("전체인구와 아시안인구") +
      xlab("asian") + ylab("total")
  
library(ggplot2)
titanic <- read.csv("C:/dataset/titanic_data/tr_mod.csv")
titanic
#geom: 
ggplot(titanic, aes(x=Pclass,y=Survived))+ geom_col()
ggplot(titanic, aes(x=Sex,y=Survived))+ geom_col()
ggplot(titanic, aes(x=Parch,y=Survived))+ geom_col()

#data =어쩌고 : 데이터 셋 종류 지정
#geom_ :
#mpg : 데이터 셋 종류



#문자 다루는 함수
str5 <- c("hello", "world", "is", "good")

#파생변수
## mutate(변수명=식..)
titanic %>% mutate(family=Sibsp + Parch)%>% head
new_dat<-titanic%>% mutate(family=SibSp + parch)
new_dat

#여러개의 변수 생성.
new_dat <- titanic %>% mutate(EM_C=ifelse(Embarked =='C',1,0),
                              EM_S=ifelse(Embarked =='S',1,0),
                              EM_Q=ifelse(Embarked == 'Q',1,0))
new_dat %>% select(EM_C,EM_S,EM_Q)

#library(dplyr) :  0이랑 1로 만드는 함수
library(dplyr)

#7-1성별 변수를 이용하여 파생변수 만들기
sex_dat <- titanic %>% mutate (S_F = ifelse(Sex == 'female', 1,0),
                               S_M = ifelse(Sex == 'male', 1,0))
sex_dat %>% select(S_F, S_M)
#7-2 10대는 1, 20대는 2 , ..., 나머지는 6으로 해서 파생변수 만들기
age_dat <- titanic %>% mutate(Age_class = ifelse(Age<10,0,
                                           ifelse(Age<20,1,
                                           ifelse(Age<30,2,
                                           ifelse(Age<40,3,
                                           ifelse(Age<50,4,
                                           ifelse(Age<60,5,6)))))))
ggplot(age_dat,aes(x=Age_class,y=Survived, fill=Sex))+geom_col()

table(age_dat$Age_class)
table(age_dat$Age_class,age_dat$Survived)

# 실습과제 
# 구글드라이브 2일차 실습과제 

