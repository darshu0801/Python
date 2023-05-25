dm = [90,80,70,60,50,40]
S = dm[0]
A = dm[1]
B = dm[2]
C = dm[3]
D = dm[4]
E = dm[5]
gr = []
im = []
mar = []
n = 0
m = 0
sub = ['EVS','MATHS','ANALOG','ARM','OS','EMFT','S&S']
for i in sub:
    print("Enter the grade obtained in ",i,": " )
    gr.append(input())
gr = [e.upper() for e in gr]
print(gr)
for j in sub:
    print("Enter the Internals marks obtained in ",j,": " )
    im.append(input())
im = [int(z) for z in im]
while n<len(im):
    for k in gr:
        if k == 'S':
            mar.append(S - im[n])
            n+=1
        elif k == 'A':
            mar.append(A - im[n])
            n+=1
        elif k == 'B':
            mar.append(B - im[n])
            n+=1
        elif k == 'C':
            mar.append(C - im[n])
            n+=1
        elif k == 'D':
            mar.append(D - im[n])
            n+=1
        elif k == 'E':
            mar.append(E - im[n])
            n+=1
mar = [y*2 for y in mar]
mar[0] = int(mar[0]/2)
while m<len(mar):
    for l in sub:
        print("marks range obtained in subject",l,"is",mar[m],"to",mar[m]+10)
        m+=1
