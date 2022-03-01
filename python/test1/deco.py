def decorator(func):
    def decorator(*args, **kwargs):
        print("%s %s " % (func.__name__, "before"))
        result = func(*args, **kwargs)
        print("%s %s" % (func.__name__, "after"))
        return result
    return decorator


# 함수에 데코레이터를 붙여준다.
@decorator
def funcdec(x, y):
    print(x + y)

funcdec(1, 2)

print("")

# 얘가 파라메터도 붙는 데코레이터
def decorator_with_param(param):
    def wrapper(func):
        def decorator(*args, **kwargs):
            print(param)
            print("%s %s" % (func.__name__, "before"))
            result = func(*args, **kwargs)
            print("%s %s" % (func.__name__ , "after"))
            return result
        return decorator
    return wrapper

@decorator_with_param("hello, decorator!")
def func(x, y):
    print(x + y)
    return x + y

func(1,2)


def a(func):
    def b(*args, **kwargs):
        print("b")
        func(*args, **kwargs)
    return b


@a
def c():
    print("55 = %s" % "c")

c()


print("")
print("")


from functools import wraps

def deco(func):
    @wraps(func)
    def deco(*args, **kwargs):
        print("%s %s" % (func.__name__, "before"))
        result = func(*args, **kwargs)
        print("%s %s" % (func.__name__ , "after"))
        return result
    return deco

def deco_with_param(func):
    def wrapper(func):
        @wraps(func)
        def deco(*args, **kwargs):
            print("%s %s" % (func.__name__, "before"))
            result = func(*args, **kwargs)
            print("%s %s" % (func.__name__ , "after"))
            return result
        return deco
    return wrapper

@deco
def func1(x, y):
    """
    x와 y를 더합니다.
    :param x:
    :param y:
    :return:
    """
    print(x + y)
    return x + y


@deco_with_param("hello, decorator!")
def func2(x, y):
    """
    x와 y를 더합니다.
    :param x:
    :param y:
    :return:
    """
    print(x + y)
    return x + y



print(func1(3, 47))
print(func1.__doc__)

func2(1, 2)
print(func2.__doc__)

