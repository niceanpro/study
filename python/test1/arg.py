def test_var_args(f_arg, *argv):
    print("첫 번째 인자 :", f_arg)
    for arg in argv:
        print("argv의 다른 인자", arg)

test_var_args('아숩', 'python', '달걀', 'test')

def test_args_kwargs(arg5, arg2, arg3):
    print('arg1:', arg5)
    print('arg2:', arg2)
    print('arg3:', arg3)

kwargs = {'arg1':3, 'arg2': "two", 'arg3': 5}
args = ('arg1', 'arg2', 'arg3')


test_args_kwargs(*args)

