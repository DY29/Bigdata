def exceptions_test5(file_path):
    try:
        f= open(file_path,'r')
    except IOError:
        print('cannot open', file_path)
    else:
        print('File has',len(f.readlines()), 'lines')
        f.close()

exceptions_test5('README-xxx.txt')


def exception_test6(file_path):
    try:
        f = open(file_path, 'r')
    except IOError:
        print('cannot open', file_path)
    else:
        print('File has', len(f.readlines()), 'lines')
        f.close()
    finally:
        print('I just tried to read this file.', file_path)

exception_test6('README-XXX.txt')


