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
	double p = 3;
	double q = 7;
	double key1 = p * q;
	int s, t;
	double e = 2;
	double r = (p - 1) * (q - 1);
	while (e < r)
	{

		if (gcd(e, r, s, t) == 1)
			break;
		else
			e++;
	}
	int k = 2;
	double d = (1 + (k * r)) / e;
	double msg;
	cout << "Enter your massage : ";
	cin >> msg;
	cout << "Message data = " << msg;
	double c = pow(msg, e);
	c = fmod(c, key1);
	cout << "\nEncrypted data = " << c;

	double m = pow(c, d);
	m = fmod(m, key1);
	cout << "\nOriginal Message Sent = " << m;

	return 0;
}
