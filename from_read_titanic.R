library(dplyr)
titanic <- read.csv("C:\\dataset\\titanic_data\\tr_mod.csv")
head(titanic,10)

names(titanic)

## 등급별 인원이 얼마나 될까?
table(titanic$Pclass)
## filter (행추출)
## filter( 조건문)
## 열 가져 오는거 : select
P1 <- titanic %>% filter(Pclass==1) %>% head(5)

#A %>%B : A결과에 대한걸 B으로 넘김

P1
head(P1)

##예제 5-1 풀기

E1 <- titanic %>% filter(Embarked=='C'& survived ==1)
E1
E2 <- titanic %>% filter(Embarked!='C' & survived ==1)
E2

P3 <- titanic %>% filter(Pclass == 1 & Survived ==1)
count(P3)
P3
sessionInfo()

# C,Q,S 산사람, 죽은사람 각각 데이터에 대한 막대 그래프 그리기 
C1 <-titanic %>% filter(Embarked == 'C' & Survived == 1)
C2 <-titanic %>% filter(Embarked == 'C' & Survived == 0)
C1
C2

Q1 <-titanic %>% filter(Embarked == 'Q' & Survived == 1)
Q2 <-titanic %>% filter(Embarked == 'Q' & Survived == 0)
Q1
Q2

S1 <-titanic %>% filter(Embarked == 'S' & Survived == 1)
S2 <-titanic %>% filter(Embarked == 'S' & Survived == 0)
S1
S2

## 타이타닉 승선자 중에 2,3등급 탄 사람들
dat <- titanic %>% filter(Pclass %in% C(2,3))
dat
sel <- c('Survived', 'Pclass', 'Name','Sex', 'Age', 'Sibsp')
dat <- titanic %>% select(sel)
head(dat,10)

# 실습 survived만 제외한 컬럼을 만들어보자
d <- titanic %>% select(-Survived)
head(d,10)
arrange(desc(d))


getwd()
sessionInfo()
a<-1
a
var1<-c(1,2,3,4,5)
var2 <- c(1:5)
var2

#seq(시작,끝,by=증가)
var4<-seq(1,15, by=3)

#예제 - titanic
# 1. 성별
s_female <- titanic %>% filter(Sex =='female' & Survived == 1)
count(s_female)
s_male <- titanic %>% filter(Sex == 'male'& Survived == 1)
count(s_male)


# 2.나이대

age <- ifelse(titanic$Age<=10, '어린이',(ifelse(titanic$Age<=20,'10대',(ifelse(titanic$Age<=30,'20대',(ifelse(titanic$Age<=40,'30대',(ifelse(titanic$Age<=50,'40대',ifelse(titanic$Age<=60,'50대',ifelse(titanic$Age<=70,'60대',ifelse(titanic$Age<=80,'70대','80대'))))))))))))
table(age)


s_age <- titanic %>% filter(age & Survived == 1)
count(s_female)






