'''
Ramesh is the principal of a school. Every year, he appoints some teachers to calculate the grades of students from the marks scored by them. Since technology is evolving Ramesh wants to digitize this process. So, he decided to hire a programmer for this task. 



You are given a dictionary where the keys are the name, and the values are another dictionary that contains subjects as keys and marks as values. Write a function convertMarks that takes a dictionary as an argument and returns a dictionary with marks replaced with grades. 
	

The principal has also provided the grades associated with the range of marks.

(Note: Both endpoints are included)


1
Grade - Marks
2
​
3
 A    -  91-100 
4
 B    -  81 - 90
5
 C    -  71 - 80
6
 D    -  61 - 70
7
 E+   -  51 - 60
8
 E    -  41 - 50
9
 F    -  0 - 40
10
​


Example input

{‘Lakshman’: {‘Maths’: 90, ‘English’: 75, ‘Social Science’: 10}


Example output

{‘Lakshman’: {‘Maths’: B, ‘English’: C, ‘Social Science’: F}
'''
def converMarks(d):
    a =[]
    dbks1 = []
    dbks2 = []
    dbks4 = {}
    dbks5 = {}
    for i in d.values():
        a.append([j for j in i.values()])
    for k in a:
        for l in range(len(k)):
            if k[l]>=91 and k[l]<=100:
                    k[l] = 'A'
            elif k[l]>=81 and k[l]<=90:
                k[l] = 'B'
            elif k[l]>=71 and k[l]<=80:
                k[l] = 'C'
            elif k[l]>=61 and k[l]<=70:
                k[l] = 'D'
            elif k[l]>=51 and k[l]<=60:
                k[l] = 'E+'
            elif k[l]>=41 and k[l]<=50:
                k[l] = 'E'
            elif k[l]>=0 and k[l]<=40:
                k[l] = 'F'
    for n in d.keys():
        dbks2.append(n)
    for o in range(len(dbks2)):
        dbks1.append(list(d[dbks2[o]].keys()))
    for aa,bb,ee in zip(dbks1,a,dbks2):
        for cc,dd in zip(aa,bb):
            dbks4[cc]=dd
        dbks5[ee]=dbks4
        dbks4 = {}
    return dbks5

name = input().split()

d = {}
for i in name:
    d[i] = {}
    subjects = input().split()
    marks = input().split()
    for j in range(len(subjects)):
        d[i][subjects[j]] = int(marks[j])

print(converMarks(d))