try:
    print('안녕하세요.')
    print(param)
except:
    print('예외가 발생했습니다.')


try:
    print('안녕하세요.')
    print(param)
except:
    print('예외가 발생했습니다!')
else:
    print('예외가 발생하지 않았습니다.')


try:
    print('안녕하세요.')
    print(param)
except:
    print('예외가 발생했습니다!')
finally:
    print('무조건 실행하는 코드')

try:
    print(param)
#exception : 오류처리 객체. 이름을 e로 지정해준것임(로그파일 남길때도 많이 씀)
except Exception as e:
    print(e)

import time
count = 1
try:
    while True:
        print(count)
        count+= 1
        
        time.sleep(0.5)
except KeyboardInterrupt:#Ctrl + c 하면 강제 종료 하는 키보드 모듈
    print('사용자에 의해 프로그램이 중단되었습니다.')