import random
L = []
for j in range(50):
    L.append(random.randint(1,10))
for k in range(len(L)-1):
    for i in range(len(L)-k-1):
        if L[i]>L[i+1]:
            L[i],L[i+1]=L[i+1],L[i]
        else:
            continue
print(L)
