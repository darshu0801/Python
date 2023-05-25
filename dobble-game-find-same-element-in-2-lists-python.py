import string
import random
z = y = 0
alphabets=[]
alphabets = list(string.ascii_letters)
c=int(input("Enter the number of elements in the list: "))
card1 = [0 for i in range(c)]
card2 = [0 for i in range(c)]
samealpha=random.choice(alphabets)
alphabets.remove(samealpha)
n1 = random.randint(0,c)
n2 = random.randint(0,c)
card1.pop(n1)
card1.insert(n1,samealpha)
card2.pop(n2)
card2.insert(n2,samealpha)
for j in range(c):
    if(j == n1 ):
        j = j+1
    else:
        z = random.choice(alphabets)
        card1.pop(j)
        card1.insert(j,z)
        alphabets.remove(z)
for k in range(c):
    if(k == n2 ):
        k = k+1
    else:
        y = random.choice(alphabets)
        card2.pop(k)
        card2.insert(k,y)
        alphabets.remove(y)
print(card1)
print(card2)
d=input("Enter the common element: ")
if d == samealpha:
    print("CORRECT")
else:
    print("WRONG it's ",samealpha)