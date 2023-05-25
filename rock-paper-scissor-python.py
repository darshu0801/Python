import random
p1points = p2points = 0
while(1):
    p1=[]
    for i in range(20):
        p1.append(random.randint(0,2))
    p2 = [j for j in p1]
    random.shuffle(p1)
    while(1):
        p1choice = int(input("p1, Enter your choice from 0 to 19:- "))
        if p1choice<20 and p1choice> -1:
            break
        else:
            print("please enter only between 0 and 19")
    while(1):
        p2choice = int(input("p2, Enter your choice from 0 to 19:- "))
        if p2choice<20 and p2choice>-1:
            break
        else:
            print("please enter only between 0 and 19")
    if(p1[p1choice]==0):
        print("p1, you chose rock")
    elif(p1[p1choice]==1):
        print("p1, you chose paper")
    elif(p1[p1choice]==2):
        print("p1, you chose scissor")
    if(p2[p2choice]==0):
        print("p2, you chose rock")
    elif(p2[p2choice]==1):
        print("p2, you chose paper")
    elif(p2[p2choice]==2):
        print("p2, you chose scissor")
    if p1[p1choice]==p2[p2choice]:
        print("draw")
    elif p1[p1choice] == 0 and p2[p2choice] == 2:
        print("p1 won")
        p1points+=1
    elif p1[p1choice] == 0 and p2[p2choice] == 1:
        print("p2 won")
        p2points+=1
    elif p1[p1choice] == 1 and p2[p2choice] == 2:
        print("p2 won")
        p2points+=1
    elif p1[p1choice] == 1 and p2[p2choice] == 0:
        print("p1 won")
        p1points+=1
    elif p1[p1choice] == 2 and p2[p2choice] == 1:
        print("p1 won")
        p1points+=1
    elif p1[p1choice] == 2 and p2[p2choice] == 0:
        print("p2 won")
        p2points+=1
    for n in range(50):
        print('-', end = '')
    print()
    if input("would you like to continue press 1:- ")!='1':
        break
print(" RESULTS\n",'p1, you won',p1points,'times\n','p2, you won',p2points,'times')