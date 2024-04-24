#include <bits/stdc++.h>
using namespace std;
int is_prime(int n);
void whosprime(int x);
void find_prime(int n, int arr[]);
bool if_prime(int n);
int factor[100];
int k = 0;
int l = 0;
int main()
{
    int n, b;
    cout << "Enter n and b: ";
    cin >> n >> b;
    if (!is_prime(n) || n % b == 0)
    {
        cout << "NO";
    }
    int flag = 1;
    int arr[n / 2];
    find_prime(n, arr);
    for (int i = 0; i <=k; i++)
    {
        cout<<arr[i];
    }

    while (1)
    {
        for (int i = 0; i < k; i++)
        {
            if (n % arr[i] == 0)
            {
                factor[l++] = arr[i];
                n /= arr[i];
                break;
            }
        }
        if (if_prime(n))
        {
            factor[l] = n;
            break;
        }
    }
    for (int i = 0; i <= k; i++)
    {
        if ((n - 1) % (factor[i] - 1) != 0)
        {
            flag = 0;
        }
    }
    if (flag == 1)
    {
        cout << "YES";
    }
    else
    {
        cout << "NO";
    }
}

void find_prime(int n, int arr[])
{
    arr[k++] = 2;
    arr[k++] = 3;
    for (int i = 4; i <= n; i++)
    {
        int flag = 0;
        for (int j = 2; j <= i / 2; ++j)
        {
            if (i % j == 0)
            {
                flag = 1;
                break;
            }
        }
        if (flag == 0)
        {
            arr[k++] = i;
        }
    }
}
bool if_prime(int n)
{
    bool is_prime = true;
    if (n == 0 || n == 1)
    {
        is_prime = false;
    }

    for (int i = 2; i <= n / 2; ++i)
    {
        if (n % i == 0)
        {
            is_prime = false;
            break;
        }
    }
    return is_prime;
}
int is_prime(int n)
{
    int flag = 0;
    for (int i = 2; i * i < n; i++)
    {
        if (n % i == 0)
        {
            flag = 1;
            break;
        }
    }
    return flag;
}

// void whosprime(int x)
// {

//     bool imPrime = true;

//     for(int i = 1; i <= x; i++)
//     {
//         for(int z = 2; z <= x; z++)
//         {
//             if((i != z) && (i%z == 0))
//             {
//                 imPrime = false;
//                 break;
//             }
//         }

//         if(imPrime && x%i == 0)
//             arr[k++]=i;

//         imPrime = true;
//     }

// }
