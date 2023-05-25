import math
a = []
b = []
e = []
k = 0
l = 0
f = []
f1 = []
dbks = {}
dbks1 = []
dbks5 = {}
za = [i for i in input("Enter the string : ")]
p=len(za)
zc=[]
ze = []
zd = set(za)
b = [i for i in range(len(zd))]
for i in zd:
    zc.append(za.count(i))
for j in zc:
    a.append(round(j/p,3))
msg_symb = list(zd)
probs = a.copy()
c = dict(zip(b, a))
items = c.items()
sorted_items = sorted(items, key=lambda x: x[1],reverse=True)
c = dict(sorted_items)
a = list(c.values())
e.append(str(a))
#print(e)
while(len(a)!=2):
    d = a[-1]+a[-2]
    a.insert(0,round(d,3))
    a.pop()
    a.pop()
    a.sort(reverse=True)
    e.append(str(a))
e.sort(reverse=True)
final = [list(map(float, s.strip('][').split(', '))) for s in e]
#print(final)
###########################################################################
for i in final:
    dbks['0'] = i[-2]
    f.append(dbks)
    dbks = {}
    dbks['1'] = i[-1]
    f.append(dbks)
    dbks = {}
    for o in reversed(range(0,len(i)-2)):
        dbks[''] = i[o]
        f.append(dbks)
        dbks = {}
#print(f)
###########################################################################
for i in final:
    dbks5[i[-2]] = '0'
    f1.append(dbks5)
    dbks5 = {}
    dbks5[i[-1]] = '1'
    f1.append(dbks5)
    dbks5 = {}
    for o in reversed(range(0,len(i)-2)):
        dbks5[i[o]] = ''
        f1.append(dbks5)
        dbks5 = {}
###########################################################################
group_size = 2  
grouped_data1 = []
i = 0
while i < len(f):
    group = []
    for j in range(group_size):
        if i + j >= len(f):
            break  
        group.append(f[i+j])
    grouped_data1.append(group)
    i += group_size
    group_size += 1
#print(grouped_data1)
grouped_data2 = []
for sub_list in grouped_data1:
    x_dicts = []
    other_dicts = []
    for d in sub_list:
        if '' in d.keys():
            x_dicts.append(d)
        else:
            other_dicts.append(d)
    other_dicts.sort(key=lambda d: list(d.values())[0], reverse=True)
    x_dicts.sort(key=lambda d: list(d.values())[0], reverse=True)
    new_sub_list = x_dicts + other_dicts
    grouped_data2.append(new_sub_list)
#print(grouped_data2)
###########################################################################
group_size1 = 2 
grouped_data3 = []
i = 0
while i < len(f1):
    group = []
    for j in range(group_size1):
        if i + j >= len(f1):
            break
        group.append(f1[i+j])
    grouped_data3.append(group)
    i += group_size1
    group_size1 += 1  
#print(grouped_data1)
grouped_data4 = []
for sub_list in grouped_data3:
    x_dicts = []
    other_dicts = []
    for d in sub_list:
        if '' in d.values():
            x_dicts.append(d)
        else:
            other_dicts.append(d)
    other_dicts.sort(key=lambda d: list(d.keys())[0], reverse=True)
    x_dicts.sort(key=lambda d: list(d.keys())[0], reverse=True)
    new_sub_list = x_dicts + other_dicts
    grouped_data4.append(new_sub_list)
#print(grouped_data4)
###########################################################################
grouped_data5 = []
for i in grouped_data4:
    grouped_data5.append(list(reversed(i)))
#print(grouped_data5)
###########################################################################
def codes(left_col,right_col,left_col1,right_col1):
    temp = float(round(left_col[-1]['1']+left_col[-2]['0'],3))
    aa = [list(ad.keys())[0] for ad in right_col1]
    ab = aa.index(temp)
    ac = right_col1[ab][temp]
    left_col1[0][left_col[-1]['1']] = left_col1[0][left_col[-1]['1']] + ac
    left_col1[1][left_col[-2]['0']] = left_col1[1][left_col[-2]['0']] + ac
    da = 0
    db = [list(ad.keys())[0] for ad in left_col1]
    dc = []
    left_col1.reverse()
    right_col1.reverse()
    for i, d in enumerate(left_col1):
        for key, value in d.items():
            if value == '':
                for a_dict in right_col1:
                    if key in a_dict:
                        left_col1[i][key] = a_dict[key]
                        right_col1.remove(a_dict)
                        break
    left_col1.reverse()
    right_col1.reverse()
    #print(left_col1,right_col1) 
###########################################################################
for i in range(0,len(grouped_data2)-1):
    codes(grouped_data2[i+1],grouped_data2[i],grouped_data5[i+1],grouped_data5[i])
#print(grouped_data5)
###########################################################################
grouped_data6 = []
for i in grouped_data5:
    grouped_data6.append(list(reversed(i)))
#print(grouped_data6)
###########################################################################
al = []
am = []
ak = grouped_data6[-1]
for i in ak:
    al.append(list(i.keys()))
    an = [inner_list[0] for inner_list in al]
    am.append(list(i.values()))
    am = [''.join(i) for i in am]
aq = am.count('')
ao =[]
for i in range(aq):
    for j in grouped_data6[i]:
        try:
            jj = list(j.keys())
            if jj[0] == an[i]: 
                ao.append(j[an[i]])
        except ValueError:
            continue
am = ao + am
while(am.count('')>0):
    am.remove('')
ap = [len(i) for i in am]
#print(an,am,ap,msg_symb)
H = [i*math.log2(1/i) for i in an]
Hcap = [an[i]*ap[i] for i in range(len(an))]
print('Entropy = ',sum(H))
print('Avg no of bits = ',sum(Hcap))
print('Efficiency = ',(sum(H)/sum(Hcap))*100)
print('Redundency = ',(1-(sum(H)/sum(Hcap)))*100)
