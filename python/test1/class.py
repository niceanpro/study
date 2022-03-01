
def scope_test():
    def do_local():
        spam = 'local spam'
        print('after dolocal assignment : ', spam)
    
    def do_nonlocal():
        nonlocal spam
        spam = 'nonlocal spam'

    def do_global():
        global spam
        spam = 'global spam'

    spam = 'test spam'
    do_local()
    print('after local assignment : ', spam)
    do_nonlocal()
    print('after nonlocal assignment : ', spam)
    do_global()
    print('after global assignment : ', spam)

scope_test()
print('in global scope :', spam)

class MyClass:
    """A Simple example class"""
    i = 1234
    kind = 'candy'

    def f(self, name):
        self.name = name
        kind = 'hehe'
        print(kind)
        print(self.kind)
        return 'hello world'

x = MyClass()
y = MyClass()
print(x.i)
print(x.f('anpro'))
print(x.kind)
print(x.name)

print('\n', x.i)
print(y.f('kim'))
print(y.kind)
print(y.name)

class Dog:
    def __init__(self, name):
        self.name = name
        self.tricks = []

    def add_trick(self, trick):
        self.tricks.append(trick)

d = Dog('fido')
e = Dog('buddy')
d.add_trick('roll over')
e.add_trick('play dead')
print(d.tricks)


def f1(self, x, y):
    return min(x, x+y)

class C:
    f = f1

    def g(self):
        return 'hello world'

    h = g

class Bag:
    def __init__(self):
        self.data = []

    def add(self, x):
        self.data.append(x)

    def addtwice(self, x):
        self.add(x)
        self.add(x)

bb = Bag()
bb.add('anpro')
print(bb.data)

bb.addtwice('a')
bb.addtwice('b')

print(bb)
print(bb.data)


class Mapping:
    def __init__(self, iterable):
        self.items_list = []
        self.__update(iterable)

    def update(self, iterable):
        for item in iterable:
            self.items_list.append(item)

    __update = update   # private copy of original update() method

class MappingSubclass(Mapping):

    def update(self, keys, values):
        # provides new signature for update()
        # but does not break __init__()
        for item in zip(keys, values):
            self.items_list.append(item)

aa = MappingSubclass(range(10))
aa.update('anpro', 'anylogic')
print(aa.items_list)

data = 'golf'
print(list(data[i] for i in range(len(data)-1, -1, -1)))

class Reverse:
    """Iterator for looping over a sequence backwards."""
    def __init__(self, data):
        self.data = data
        self.index = len(data)

    def __iter__(self):
        return self

    def __next__(self):
        if self.index == 0:
            raise StopIteration
        self.index = self.index - 1
        return self.data[self.index]

rev = Reverse('spam')
iter(rev)
for char in rev:
    print(char)

import re
ret = re.sub(r'(\b[a-z]+) \1', r'\1', 'cat in the the hat')
print(ret)

print(re.search('k', 'anpro is an excellent!', 0))
print(re.search('an', 'anpro is an excellent!', 1))

print(re.match('k', 'anpro is an excellent!', 0))
print(re.match('an', 'anpro is an excellent!', 1))

print(re.fullmatch('k', 'anpro is an excellent!', 0))
print(re.fullmatch('an', 'anpro is an excellent!', 0))
print(re.fullmatch('an', 'anpro is an excellent!', 1))

print(re.findall('k', 'anpro is an excellent!', 0))
print(re.findall('an', 'anpro is an excellent!', 0))
print(re.findall('an', 'anpro is an excellent!', 1))
