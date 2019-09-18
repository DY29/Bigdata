install.packages('gridExtra')
01_  library(dplyr)___________ ## 01: dplyr라이브러리 불러오기 
02______library(ggplot2)________ ## 02: ggplot2 라이브러리 불러오기
03_______library(gridExtra)_______ ## 03: gridExtra 라이브러리 불러오기 
4번: df <- 04___read.tr_mod.csv_______("Data/tr_mod.csv") ## 04 : tr_mod.csv 파일 읽어오기 
05__dim(gridExtra)____(df) ## 05 : df 행열 확인하기
06__str(gridExtra)____(df) ## 06 : df 데이터 속성출력
07__names(gridExtra)____(df) ## 07 : df컬럼명 확인하기 
## table을 통하여 변수의 값들이 몇 개씩 존재하는지, 데이터의 개수를 알 수 있다. table(08_girdExtra_____) ## 08 : 
09번 Pclass 별 인원 파악하기 09 ______ ## 09 
num1 <- titanic%>% filter(Pclass == 1)
num2 <- titanic %>% filter(Pclass == 2)
num3 <- titanic %>% filter(Pclass == 3)
count(num1)
count(num2)
count(num3)
10번 :Embarked 별 인원 파악하기 10_____________ ## 10 : Survived 별 인원 파악하기 
s_num <- titanic %>% filter(Embarked == "S")
c_num <- titanic %>% filter(Embarked == "C")
q_num <- titanic %>% filter(Embarked == "Q")
count(s_num)
count(c_num)
count(q_num)
11번 _____________ ## 11 : SibSp 별 인원 파악하기기 
sib_0 <- titanic %>% filter(SibSp == 0)
sib_1 <- titanic %>% filter(SibSp == 1)
sib_2 <- titanic %>% filter(SibSp == 2)
sib_3 <- titanic %>% filter(SibSp == 3)
sib_4 <- titanic %>% filter(SibSp == 4)
sib_5 <- titanic %>% filter(SibSp == 5)
sib_6 <- titanic %>% filter(SibSp == 6)
sib_7 <- titanic %>% filter(SibSp == 7)
sib_8 <- titanic %>% filter(SibSp == 8)
count(sib_0)
count(sib_1)
count(sib_2)
count(sib_3)
count(sib_4)
count(sib_5)
count(sib_6)
count(sib_7)
count(sib_8)
12____(df$Age) ## 12 : Age중 가장 많은 수
max(df$Age)
min(df$Age)
13____(df$Age) ## 13 : Age중 가장 적은 수 
p1 = 14___(data = 14___, aes(x = 14___, y = Survived, fill = Sex)) + geom_col() ## 14 : ggplot을 이용한 나이(Age)별 생존수(Survived)그래프 p2 = 15___(data = 15___, aes(x = 15___, y = Survived, fill = Sex)) + geom_col() ## 15 : ggplot을 이용한 성별(Sex)별 생존수(Survived) 그래프 
p3 = 16___(data = 16___, aes(x = 16___, y = Survived, fill = Sex)) + geom_col() ## 16 : ggplot을 이용한 Pclass 별 생존수(Survived) 그래프 p4 = 17___(data = 17___, aes(x = 17___, y = Survived, fill = Sex)) + geom_col() ## 17 : ggplot을 이용한 Embarked 별 생존수(Survived) 그래프 
grid.18___(p1, p2, p3, p4, 18___ = 2, nrow = 2, top = "Titanic _ Survived") ## 18 : grid를 이용하여 그래프를 나열해 보자. 
## 19 : 생존에 가장 큰 영향을 미치는 변수는 무엇인가? 
## 결측치는 누락된 값, 비어있는 값을 말한다. 결측치가 있으면 함수가 적용되지 않거나 분석 결과가 왜곡되는 경우가 있다. ## 결측치가 있는지 확인후 결측치가 있는 행을 제거 하거나 다른 값으로 대처를 해야한다. 

sum(20___) ## 20 : df 데이터의결측치 갯수를 알아보자. colSums(20___) ## 20 : df 컬럼별 결측치 갯수를 알아보자. colSums(!20___) ## 20 : df 컬럼별 결측치가 아닌 갯수 알아보자. 
## 21 : 컬럼중 결측치가 존재하는 컬럼명을 적으세요. 

df$Cabin <- ifelse(is.na(22___), 'AAA', 22___) ## 22 : Cabin이 NA인 경우 'AAA'로 값을 입력 df$Cabin 
