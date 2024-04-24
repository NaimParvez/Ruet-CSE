#include <bits/stdc++.h>
using namespace std;
bool is_composit(int n);
void factor(int n, int fact[]);
int m = 0;
int main()
{
	int n, a;
	cin >> n >> a;
	int fact[n];
	if (is_composit(n) && n % a != 0)
	{
		factor(n, fact);
	}
}

bool is_composit(int n)
{
	if (n == 2 || n == 3)
	{
		return 0;
	}
	else
	{
		for (int i = 3; i * i < n; i++)
		{
			if (n % i == 0)
			{
				return 1;
			}
		}
		return 0;
	}
}

void factor(int n, int fact[])
{
	int arr[n];
	for (long long i = 2; i * i <= n; i++)
    {
        for (long long k = i+1; k <= n; k++)
        {
            if (k%i== 0)
            {
                arr[k] = 1;
            }
        }
    }
    for(long long i=3;i<=n;i++)
    {
        if(arr[i]!=1&&n%arr[i]==0)
        {
			fact[m++]=i;        
        }

    }
	
}
