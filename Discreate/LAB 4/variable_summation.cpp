#include<bits/stdc++.h>

using namespace std;

#define ll long long
#define fr(m) for(int i=0; i<m; i++)
#define fro(m) for(int i=1; i<m; i++)
#define frj(m) for(int j=0; j<m; j++)
#define frr(n) for(int i=n; i>=0; i--)
#define fva(x,y) for(int i=x;i<=y;i++)
#define pb push_back
#define pf push_front
#define orr ||
#define nl '\n'
#define nll cout<<'\n'   
#define mod 1000000007
#define inf (1LL<<61)
#define inff (1<<30)
#define yes cout<<"YES"<<nl
#define no cout<<"NO"<<nl

long long c = 0;
long long pre = 0;
long long s = 0;
void summation(int a, int size, int arr[])
{
	if (a <= 0)
	{
		cout << "The sum is " << pre << endl;
		return;
	}
	else
	{
		int l,u;
		cin >> l >> u;
		int pin = (u - l) + 1;
		fva(l,u)
			s += (arr[c] * j);
		for (int kk = c + 1; kk < size)
			arr[kk] *= pin;
		pre = pre * pin + s;
		s = 0;
	}
	a--;
	c++;
	summation(a, size, arr);
}
int main()
{
	int no;
	cout <<"Enter How many Summation : ";
	cin >> no;
	int lim[no];
	cout <<"Order the Sum signs and variables from left to right" << endl;
	cout <<"The " << no << " Coefficients Left to right: ";
	for (int i = 0; i < no; i++)
		cin >> lim[i];
	cout <<"Enter limits of summations : ";
	summation(no, no, lim);
}