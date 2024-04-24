#include <bits/stdc++.h>
using namespace std;

int gcd(int a, int b, int &s, int &t)
{
    if (b == 0)
    {
        s = 1;
        t = 0;
        return a;
    }
    int r = gcd(b, a % b, s, t);
    int x = t;
    t = s - (a / b) * t;
    s = x;
    return r;
}
int main()
{
    int a, b;
    int s, t;
    cout << "Enter 2 number :";
    cin >> a >> b;
    if (a >= b)
    {
        cout << "GCD= " << gcd(a, b, s, t) << endl;
    }
    else
        cout << "GCD= " << gcd(b, a, s, t) << endl;

    cout << "BEZOUT's COEFFICIENT: ";
    cout << s << " " << t;
    return 0;
}