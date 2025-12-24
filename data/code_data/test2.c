
#include <stdio.h>

int func1()
{
    int j = 2;
    int k = 3;
    int l = 0;
    int o = 0;
    int u = k+l;
    int w = o+l;
    int z = u+w;
    int t = z;
    return j+t;
}

int func2(int i)
{
    int j = i;
    int k = 3;
    int l = 0;
    int o = 0;
    int u = k+l;
    int w = o+l+func1();
    int z = u+w;
    int t = z;
    return j+t;
}

int combine()
{
    int a = 2;
    int b = 3;
    int c = b * a;
    int x = func1()+func2(c);
    int d = func2(c);
    return x + d;
}