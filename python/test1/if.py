# coding=utf-8

# 조건문

age = 2
sex = 'm'
if age >= 21:
    print('트럭도 운전 가능합니다')
elif age >= 16:
    print('자동차만 운전 가능합니다')
else:
    print('아직 운전 못합니다.')

if age >= 21 and sex == 'f':
    print('트럭도 운전 가능합니다')
elif age >= 16 or sex != 'f':
    print('자동차만 운전 가능합니다')
else:
    print('아직 운전 못합니다.')

for i in range(10):
    if i == 15:
        break
    elif i > 3:
        continue
    print(i)
else :
    print("end")

