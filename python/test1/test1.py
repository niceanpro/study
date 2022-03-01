#coding=utf-8

week = ["월", "화", "수", "목", "금", "토", "일"]
print("1번째 = ", week[0])
print("1-5번째 = ", week[3:5])

week.append('이것은')

print(week)
week.insert(3, '세번째')
print(week)

week.remove('화')
print(week)

week.sort()
print(week)

week.reverse()
print(week)

# 주석

"""
여러줄의 주석
"""
pi = (3, 1, 4, 1, 5, 9)
print(pi)
print(pi + pi)
print(pi * 3)

ll = list(pi)
print(ll)

new_pi = tuple(ll)
print(new_pi)

print(len(new_pi))
