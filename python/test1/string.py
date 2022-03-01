print('We are the {} who say "{}!"'.format('knights', 'Ni'))

print('{1} and {0}'.format('spam', 'eggs'))

print('This story of {0}, {1}, and {other}.'.format('Bill', 'Manfred', other='Georg'))

table = {'Sjoerd':2127, 'Jack': 4098, 'Dcab': 8895}
print('Jack:{0[Jack]:d}; Sjoerd:{0[Sjoerd]:d} Dcab: {0[Dcab]:d}'.format(table))

for x in range(1, 11):
    print('{0:2d} {1:3d} {2:4d}'.format(x, x*x, x*x*x))

for x in range(1, 11):
    print(repr(x).rjust(2), repr(x*x).center(5), end=' ')
    print(repr(x*x*x).ljust(5))

for x in range(1, 11):
    print(str(x).zfill(5))


with open('b.txt', 'ab+') as f:
    print(f.write(b'0123456789abcdef'))
    print(f.seek(5))
    print(f.read(1))
    print(f.seek(-3, 2))
    print(f.read(1))
