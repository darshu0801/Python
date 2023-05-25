import numpy
n = int(input("Enter the Size of matrix: "))
if (n%2 != 0):
    matrix = [[0 for i in range(n)] for j in range(n)]
else:
    print("PLEASE ENTER ODD NUMBERS ONLY")
    exit()
i = n//2
j = n-1
z = y = 0
k = 1
m = n
while(y<n):
    while(z<n):
        matrix[i][j]=k
        k = k + 1
        i = i - 1
        j = j + 1
        if i<0:
            i = n + i
        elif j>=n:
            j = 0
        z = z + 1
    j = j - 2
    i = i + 1
    if j < 0:
        j = n + j
    elif i >= n:
        i = 0
    z = 0
    y = y + 1
print(numpy.matrix(matrix),"\n","The Sum of each row/column/diagnol is: ",sum(matrix[1]))
