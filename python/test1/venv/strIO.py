#coding=utf-8


for i in range(50):
    print(i, end=' ')

print()

i = 0
while i <= 30:
    i += 1
    if i%2 == 0:
        print(i)

# 문자열, 파일 입출력(Input, Output)

alpha="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
print(alpha[0:3])
print(alpha[-3:])
print(alpha[:-3])
print(alpha[0:3] + " Hello")


print("나는 %d살이고요, 몸무게는 %.1f 키로 이구요, 취미는 %s입니다. %%는 이렇게 표현합니다." %(19, 67, 'piano'))

print(alpha.capitalize())
print(len(alpha))
print(alpha.replace("A", 'a'))

# 파일 개체명= open(파일명, 모드(mode))
# r : 읽기,  r+ : 읽기 쓰기, w : 쓰기, a : 쓰기 + 이어쓰기, t : text, b : binary
# mode 는 서로 조합해서 사용할 수 있다.

t_file = open("t.txt", "wb")
print(t_file.mode)
print(t_file.name)
t_file.write(bytearray("안녕하세요\n", "utf-8"))
t_file.close()

# 읽어주기

t_file = open('t.txt', 'rb')
pp = t_file.read()
print(pp, "utf-8")
t_file.close()


