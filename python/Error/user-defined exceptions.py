# 예외 클래스
class TooBigNumError(Exception):
    def __init__(self, val):
        self.val = val
    def __str__(self):
        return 'too big number {}. Use 1~10! '.format(self.val)
raise TooBigNumError(15)

# 사용자 정의 예외를 위한 테스트 함수
def user_defined_exception_test():
    num = int(input('1부터 10 사이의 점수를 입력하세요! : '))   # 숫자 입력
    if num > 10:
        raise TooBigNumError(num)                              # 에러 발생
    print('숫자 {} 를 입력하셨군요! '.format(num))             # 정상인 경우 출력문

# 정상 Case 입력
user_defined_exception_test()
# 에러 Case 입력
user_defined_exception_test()
