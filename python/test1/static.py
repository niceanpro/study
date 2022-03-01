#static variable
def static_vars(**kwargs):
    def decorate(func):
        for k in kwargs:
            setattr(func, k, kwargs[k])
        return func
    return decorate

#@static_vars(counter=0)
@static_vars(counter=5, counter1=8)
def foo():
    foo.counter += 1
    foo.counter1 += 1
    print("counter is %d" % foo.counter)
    print("counter1 is %d" % foo.counter1)

for i in range(10):
    foo()

i = 5
def f(arg=i):
    print(arg)

i = 6
f()

def ff(a, L=[]):
    L.append(a)
    return L

print(ff(1))
print(ff(2))
print(ff(3))

def make_incrementor(n):
    return lambda x : x + n

f = make_incrementor(42)
print('f(0) = ', f(0))
print('f(1) = ', f(1))

def my_doc():
    """ kddk
    sss"""
    pass

print(my_doc.__doc__)

my_list = list(range(-3, 5))
print(my_list)
idx = my_list.index(0, 0, len(my_list))
my_list.remove(3)
my_list.insert(2, 100)
po = my_list.pop()
c = my_list.count(4)
my_list.sort()
dup = my_list

co = my_list.copy()

my_list.clear()
print(my_list)


sqares = []
for x in range(10):
    sqares.append(x**2)

sqares1 = list(map(lambda x :x**2, range(10)))
sqares2 = [x**2 for x in range(10)]
sqares3 = [(x, y) for x in [1, 2, 3] for y in [3, 1, 4] if x != y]
print(sqares3)

from math import pi
print([str(round(pi, i)) for i in range(1, 6)])

matrix = [
    [21, 22, 23, 24],
    [25, 26, 27, 28],
    [29, 30, 31, 32]
]
ll = len(matrix[0])

mr = [[row[i] for row in matrix] for i in range(4)]
print(mr)

mmm = list(zip(*matrix))
print(mmm)

rm = list(list(zip(*mmm)))

print(rm)

a = list(range(10))
del a[2]
del a[4:6]
del a[:]

print(a)

empty = ()
sig = 'hello',

elen = len(empty)
slen = len(sig)
print(sig)

a = set('abracadabra')
b = set('alacazam')
print('a - b = ', a - b)
print('a | b = ', a | b)
print('a & b = ', a & b)

knight = {'gallahad':'the pure', 'robin':'he brave'}
for k, v in knight.items():
    print(k, v)

for i in reversed(range(1, 10, 2)):
    print(i)


a1 = (1, 2, 3)
a2 = (1, 2, 4)

s = True if a1 < a2 else False
print(s)
