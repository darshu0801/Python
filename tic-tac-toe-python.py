import numpy
L = [['-' for z in range(3)] for y in range(3)]
p1 = '0'
p2 = 'x'
n = 0
print(numpy.matrix(L))
def rows(sym):
    if (((L[0][0] == L[0][1]) and (L[0][1] == L[0][2])) == sym):
        return True
    elif (((L[1][0] == L[1][1]) and (L[1][1] == L[1][2])) == sym):
        return True
    elif (((L[2][0] == L[2][1]) and (L[2][1] == L[2][2])) == sym):
        return True
    
while(n<5):
    print("p1 enter ur choice in this format : row(space)column")
    a = input().split()
    L[int(a[0])-1][int(a[1])-1] = p1
    print(numpy.matrix(L))
    if(rows('0')):
        break
    elif(rows('x')):
        break
    if n == 4:
        break
    print("p2 enter ur choice in this format : row(space)column")
    b = input().split()
    L[int(b[0])-1][int(b[1])-1] = p2
    n = n+1
    print(numpy.matrix(L))
    if(rows('0')):
        break
    elif(rows('x')):
        break
    #if (((L[0][0] == L[1][1]) and (L[1][1] == L[2][2])) == ('0' or 'x')) or (((L[2][0] == L[1][1]) and (L[1][1] == L[0][2])) == ('0' or 'x')):
    #    break
    #elif (((L[0][0] == L[0][1]) and (L[0][1] == L[0][2])) == ('0' or 'x')) or (((L[1][0] == L[1][1]) and (L[1][1] == L[1][2])) == ('0' or 'x')) or (((L[2][0] == L[2][1]) and (L[2][1] == L[2][2])) == ('0' or 'x')):
    #    break
    #elif (((L[0][0] == L[1][0]) and (L[1][0] == L[2][0])) == ('0' or 'x')) or (((L[0][1] == L[1][1]) and (L[1][1] == L[2][1])) == ('0' or 'x')) or (((L[0][2] == L[1][2]) and (L[1][2] == L[2][2])) == ('0' or 'x')):
    #    break
