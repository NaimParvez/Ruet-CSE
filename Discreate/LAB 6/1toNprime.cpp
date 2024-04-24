#include <bits/stdc++.h>
using namespace std;
void prime(long long n);
int main()
{
    long long int n;
    cout << "enter range: ";
    cin >> n;
    prime(n);
}
void prime(long long n)
{

    long long arr[n];
    for (long long i = 2; i * i <= n; i++)
    {
        for (long long k = i + 1; k <= n; k++)
        {
            if (k % i == 0)
            {
                arr[k] = 1;
            }
        }
    }
    cout << " 2";
    for (long long i = 3; i <= n; i++)
    {
        if (arr[i] != 1)
        {
            cout << " " << i;
        }
    }
}
