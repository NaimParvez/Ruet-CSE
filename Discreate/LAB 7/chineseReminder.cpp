#include <bits/stdc++.h>
using namespace std;
int gcd(int a, int b, int &s, int &t);
int main()
{
    cout << "Number of Congurence: ";
    int num;
    cin >> num;
    pair<int, int> p[num];
    // pair<int,int> P2;
    // pair<int,int> P3;

    // x=a (mod m)
    cout << "input a and m" << endl;
    for (int i = 0; i < num; i++)
    {
        cin >> p[i].first >> p[i].second;
    }
    long long M = 1;
    cout << endl;
    for (int i = 0; i < num; i++)
    {
        M *= p[i].second;
    }
    cout << "\tM= " << M << endl;
    int m[num];
    for (int i = 0; i < num; i++)
    {
        m[i] = M / p[i].second;
        cout << "\tm" << i << "= " << m[i] << endl;
    }
    int s, t;
    pair<int, int> p2[num];
    for (int i = 0; i < num; i++)
    {
        int r = gcd(m[i], p[i].second, s, t);
        if (r == 1)
        {
            p2[i].first = s;
            if (p2[i].first < 0)
            {
                p2[i].first = p[i].second - abs(p2[i].first);
            }
            p2[i].second = t;
            cout << "\tY" << i << "= " << p2[i].first << endl;
        }
        else
        {
            cout << " can't be determined";
        }
    }
    long long x = 0;
    for (int i = 0; i < num; i++)
    {
        x += p[i].first * m[i] * p2[i].first;
    }
    cout << "\tX= " << x << endl;
    cout << "\tChinese remainder= " << x % M;
}
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