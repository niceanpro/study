from collections import defaultdict

colours = (
    ('태희', '노랑'),
    ('지훈', '파랑'),
    ('별이', '초록'),
    ('지훈', '검정'),
    ('태희', '빨강'),
    ('샛별', '실버'),
)

favourite_colours = defaultdict(list)

for name, colour in colours:
    favourite_colours[name].append(colour)

print(favourite_colours)


import collections
tree = lambda : collections.defaultdict(tree)

some_dict = tree()

some_dict['colours']['favourite'] = '노랑'

