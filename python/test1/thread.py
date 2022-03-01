import sys
# from thread import start_new_thread
import threading

def heron(a):
    """Calculates the square root of a"""
    eps = 0.0000001
    old = 1
    new = 1
    while True:
        old,new = new, (new + a/new) / 2.0
        print (old, new)
        if abs(new - old) < eps:
            break
    return new

threading.Thread(target=heron, args=99).start()
threading.Thread(target=heron, args=999).start()
threading.Thread(target=heron, args=1733).start()

c = input("Type something to quit.")