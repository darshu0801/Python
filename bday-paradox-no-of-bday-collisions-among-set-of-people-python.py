import random
z = 0
bday = []
temp = int(input("Enter the number of people: "))
while(z<temp):
    year = random.randint(1900,2022)
    if (year % 4 == 0 or year % 400 == 0 and year % 100 != 0):
        leapyr = 1
    else:
        leapyr = 0
    month = random.randint(1,12)
    if(leapyr==1 and month == 2):
        date = random.randint(1,29)
    elif(leapyr!=1 and month == 2):
        date = random.randint(1,28)
    elif(month == 1,3,5,7,8,10,12):
        date = random.randint(1,31)
    else:
        date = random.randint(1,30)
    nodily = [31,29,31,30,31,30,31,31,30,31,30,31]#no of days in a leap yr
    nodinly = [31,28,31,30,31,30,31,31,30,31,30,31]#no of days in a non leap yr
    day = 0
    if(leapyr == 1):
        for i in range(month-1):
            day = day + nodily[i]
        day = day + date
    elif(leapyr==0):
        for i in range(month-1):
            day = day + nodinly[i]
        day = day + date
    bday.append(day)
    z = z + 1
e = len(bday)
res = [*set(bday)]
f = len(res)
bday.sort()
print(bday)
print("Number of bday collisions among ",temp," people are ",e-f)