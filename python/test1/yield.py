def generator_function():
    for i in range(10):
        yield i

for item in generator_function():
    print(item)


def fibon(n):
    a = b = 1
    for i in range(n):
        yield i, a
        a, b = b, a + b

for i, x in fibon(100):
    print(i+1, ' ', x)


def fibon1(n):
    a = b = 1
    result = []
    for i in range(n):
        result.append(a)
        a, b = b, a + b
    return result

r = fibon1(100)
print(r)


def gen_next():
    for i in range(3):
        yield i

gen = gen_next()
print(next(gen))
print(next(gen))
print(next(gen))

my_string = "Yaa hoo!!!"

my_iter = iter(my_string)
print(next(my_iter))

items = range(1, 6)

squard = []
for i in items:
    squard.append(i**2)
print(squard)

sq = []
sq = list(map(lambda x : x**2, items))
print('map = ', sq)


num_list = range(-5, 5)

le_zero = tuple(filter(lambda x :x < 0, range(-5, 6)))

print('filter = ', le_zero)


from functools import reduce
product = reduce((lambda x, y: x * y), [1, 2, 3, 4])
print('reduce = ', product)

some_list = ['a', 'b', 'c', 'd', 'b', 'c', 'd']
dup = set(x for x in some_list if some_list.count(x) > 1)
print('set for if = ', dup)
ll = list(x for x in range(-3, 10) if x%3 == 0)
print('ll for if = ', ll)
ls = list(x for x in some_list if some_list.count(x) > 1)
print('ls for if = ', ls)


if_fat = True
state = 'fat' if if_fat else 'not fat'
print('state 3항 = ', state)

def sum(n):
    s = 0
    for i in range(n):
        s += i
    return s

print(sum(3))
print(sum(5))
print(sum(10))

