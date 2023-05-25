import random
da = db = dc = dd = 0
while(1):
    a = [0 for j in range(3) ]
    b = random.randint(0,2)
    d = [0,1,2]
    f = [0,1,2]
    a[b] = 'gold'
    for i in range(3):
        if i==b:
            continue
        else:
            a[i] = 'stone'
    c = int(input("guess which door has gold among 0,1,2:-"))
    d[a.index('gold')] = 'x'
    d[c] = 'x'
    print(a)#comment this line if you dont want to see the answers prior
    print("let me make your choice simpler")
    for l in range(len(d)):
        if d[l] == 'x':
            continue
        elif d[l] != 'x':
            print('door',l,'contains stone')
            break
    f[l] = 'x'
    e = input("would you like to swap your choice??(yes/no)")
    e = e.upper()
    if e == 'YES':
        f[c] = 'x'
        for m in range(len(d)):
            if f[m] == 'x':
                continue
            elif (a[m]=='gold'):
                print('HURRAY YOU WON')
                da+=1
                break
            elif (a[m]!='gold'):
                print('SORRY YOU LOSE')
                db+=1
                break
    elif e == 'NO':
        if (a[c]=='gold'):
            print('HURRAY YOU WON')
            dc+=1
        else:
            print('SORRY YOU LOSE')
            dd+=1
    for n in range(50):
        print('-', end = '')
    print()
    h = input("WOULD YOU LIKE TO CONTINUE??(yes/no) :-")
    for n in range(50):
        print('-', end = '')
    print()
    h = h.upper()
    if (h == 'YES'):
        continue
    else:
        break
print(' RESULTS\n',"WITHOUT SWAPPING YOU WON",da,"TIMES\n","WITHOUT SWAPPING YOU LOSE",db,"TIMES\n","WITH SWAPPING YOU WON",dc,"TIMES\n","WITH SWAPPING YOU LOSE",dd,"TIMES\n")
