install.packages("dplyr")
library("dplyr")

## 결측치 처리 
df <- data.frame(Pclass = c(1, 2, 3, NA, 1), 
                 Embarked = c("C", "S", "Q", NA, NA), 
                 Fare = c(NA,150,200, 300, 100))
df
is.na(df)
table(is.na(df))

## PClass 결측치 확인
table(is.na(df$Pclass))

## EMbarked 결측치 확인
table(is.na(df$Embarked))

## Fare 결측치 확인
table(is.na(df$Fare))

##
df
library(dplyr)
df %>%filter(!is.na(Pclass))
mean(df$Pclass)

## 실습 3-2 
## Embarked NA 빼고 출력
Embarked_NA <- df %>%filter(!is.na(Pclass))
Embarked_NA

## Fare NA 빼고 출력
Fare_NA <- df %>%filter(!is.na(Fare)) 
Fare_NA

##마지막 모든 NA를뺴고 출력하기
All_NA <- df %>%filter(!is.na(Fare) & !is.na(Pclass) & !is.na(Embarked)) 
All_NA

##
mean(df$Fare , na.rm = T)
min(df$Fare, na.rm = T)

## 데이터 선택(행, 열, )
mtcars[seq(1,10,1),]

mc_part <- mtcars
mc_part[c(4,8), 'drat'] <- NA
mc_part

##
mc_part %>% summarise(mean_drat = mean(drat, na.rm = T),
                      sum_drat = sum(drat, na.rm = T),
                      med_drat = median(drat,na.rm = T))
mc_part

## 실습 4-1 qsec를 4,8 행의 데이터를 NA를 처리하고
qsec_na <- mc_part[c(4,8), 'qsec']
qsec_na
## mean, sum, median, var, sd 해라
mc_part %>% summarise(mean_qsec = mean(qsec, na.rm = T),
                      sum_qsec = sum(qsec, na.rm = T),
                      med_qsec = median(qsec,na.rm = T),
                      var_qsec = var(qsec, na.rm = T), 
                      sd_qsec = sd(qsec,na.rm=T))

## cyl 로 그룹 지어서해봐라
summarise(group_by(mc_part,cyl))

## 이상치 찾고 처리 # 이상치 : outlier
outlier <- data.frame(Pclass=c(1,2,3,4,55,3,1,1,2), family = c(1,2,3,1,2,3,1,1,1))
outlier
library(ggplot2)
ggplot(outlier, aes(x= Pclass)) + geom_bar()

## 금융회사 같이 패키지 없어서 못쓰는 곳에서는 실무적으로
## 이렇게 많이 씀
## %in% : 어떤 값이 어디에 포함이 되면 True, 포함되지 않으면 False. 벡터단위로 저장 
outlier$Pclass %in% c(1,2,3)
## %notin% : 
install.packages('Hmisc')
library(Hmisc)
`%notin%` <-Negate('%in%')

outlier$Pclass %in% c(1,2,3)
outlier$Pclass

## dat[행, 열]
outlier[!(outlier$Pclass %in% c(1,2,3)),]
outlier[(outlier$Pclass %notin% c(1,2,3)),]
outlier$Pclass %notin% c(1,2,3)

## outlier
outlier[outlier$Pclass %notin% c(1,2,3),  ]

## 5-1 Family에서 1,2명인 경우만 뽑기 = in 써서
## notin 써서 뽑아보기
outlier[!(outlier$family %in% c(1,2)),]
outlier$family %in% c(1,2)

outlier[(outlier$family %notin% c(1,2)),]
outlier$family %notin% c(1,2)


## 뺄값 뺴고 다수가 나온 값으로 대치 시켜 봐라

## Pclass 에서 123 인 값 빼고 대치 시켜 봐라
outlier[outlier$Pclass %notin% c(1,2,3), 'Pclass' ] = 1
outlier[c(4,5),]   # 아까 행 4,5행 확인
outlier
library(ggplot2)
ggplot(outlier, aes(x=Pclass)) + geom_bar()

## R에 관한 최신 연구들 볼수 있는 사이트
## %notin% : https://www.r-bloggers.com/the-notin-operator/



## 자연어 처리
install.packages('rJava')
install.packages('memoise')
install.packages('KoNLP')

library(rJava)
library(memoise)
library(KoNLP)

search()

## 사전 설정하기(useNIADic() : 사전임)
useNIADic()

## 데이터 준비하기
txt <- readLines("D:\\dataset\\movieText\\spiderman.txt")
head(txt)

## 문자열 처리하기
install.packages("stringr")
library(stringr)

## 특수문자 제거
txt <- str_replace_all(txt, "\\W", " ")
txt

### 명사 추출
### KoNLP의 extractNoun()를 이용
library(KoNLP)
extractNoun("오늘은 즐거운 날이다. 당신은 소중한 사람입니다.")
nouns <- extractNoun(txt)
is(nouns) # 변수 종류 확인
nouns
# table : 빈도 출력
wordCount <- table(unlist(nouns)) # unlist : 리스트 자료형 깨주기(줄을 벡터로 변환)
table(unlist(nouns))
wordCount

### 데이터 프레임 전환
df_word <- as.data.frame(wordCount, stringsAsFactors = F)
df_word

### 변수명 수정
library(dplyr)
df_word <- rename(df_word, word=Var1, freq=Freq)
df_word

### 두글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)
df_word

####워드 클라우드
install.packages("wordcloud")

## 패키지 로드
library(wordcloud)
library(RColorBrewer)

## 색상 추출
pal <- brewer.pal(8, "Dark2")
set.seed(1004)

## 워드 클라우드 제작 
wordcloud(word = df_word$word, # 단어
          freq = df_word$freq, # 빈도
          min.freq = 2,        # 최소 단어 빈도
          max.words = 100,     # 최대 표현 단어 수
          random.order = F,    # 고빈도 단어 중앙 배치(F: 하지 않음.)
          rot.per = 0.1,       # 회전 단어 비율 지정 
          scale = c(5, 0.2),   # 단어 크기 범위
          colors = pal)        # 색상 목록


