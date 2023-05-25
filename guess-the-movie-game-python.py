import random
ls = ['KGF','JAMES','OLDMONK','CHASE','PETROMAX','LOVEMOCKTAIL','GAALIPATA','WINDOWSEAT','BAIRAGEE','AVATARAPURUSHA']
a = random.randint(0,len(ls)-1)
count = 0
for i in ls[a]:
    count = count + 1
movie = ['_' for j in range(count)]
print(' '.join(movie))
print("GUESS THE MOVIE IT HAS ",count," LETTERS")
x = 0
y = 0
bs = []
for z in ls[a]:
    bs.append(z)

dd = input("DO YOU KNOW THE ANSWER (y/n): ")
if(dd=='y'):
    ans = input("TELL THE NAME OF THE MOVIE: ")
    if(ans == ls[a]):
        print("GREAT YOUR SCORE IS 10")
    else:
        print("SORRY ITS WRONG GUESS THE LETTERS NOW")
        while(x<count):
            m = input("ENTER THE LETTER: ")
            for o in bs:
                if (o==m and bs.count(m)>=1):
                    temp = bs.index(o)
                    movie.pop(temp)
                    movie.insert(temp,o)
                    bs.pop(temp)
                    bs.insert(temp,0)
                    x = x+1
                elif(o==m):
                    temp = bs.index(o)
                    movie.pop(temp)
                    movie.insert(temp,o)
                    x = x+1
            print(movie)
            y = y+1
else:
    print("NO WORRIES GUESS THE LETTERS NOW")
    while(x<count):
        m = input("ENTER THE LETTER: ")
        for o in bs:
            if (o==m and bs.count(m)>=1):
                temp = bs.index(o)
                movie.pop(temp)
                movie.insert(temp,o)
                bs.pop(temp)
                bs.insert(temp,0)
                x = x+1
            elif(o==m):
                temp = bs.index(o)
                movie.pop(temp)
                movie.insert(temp,o)
                x = x+1
        print(movie)
        y=y+1
print("YOU TOOK ",y," ITERATIONS TO GUESS THE MOVIE ","YOUR SCORE IS ",10-(y/count))