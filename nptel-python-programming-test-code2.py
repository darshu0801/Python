'''
Shyam has N Jars of Ladoos and he wants to distribute the Ladoos amongst M Villagers. The i-th jar contains Li pieces of Ladoos. He wants to make sure that every villager gets the same amount of ladoos and that the number of ladoos they receive is the greatest possible. He can open each jar and mix all the ladoos before distributing them to the villagers. How many pieces of ladoos will remain after he shares them amongst villagers, based on the rules described above?


Input:
The first line of input contains two integers: integer N, the number of ladoos, and M, number of villagers.
The next line contains N non-negative integers.

Output:
The remaining number of ladoos according to rule described above.

Input:
7 3
1 2 3 4 5 6 7

Output:
1

Explanation: 
we have N=7 Jars of Ladoos. In total, we have 1+2+3+4+5+6+7=28 ladoos that we want to divide between M=3 villagers. Every villager can get 9 pieces of ladoos, so 28−3×9=1 pieces of ladoos will remain.
'''
a = input().split()
b = [int(m) for m in input().split()]
print(sum(b)%int(a[1]),end = '')