#include <bits/stdc++.h>
#include <math.h>
using namespace std;
#define ll long long
int gcd(int a, int b);
int main()
{
    ll prime1, prime2;
    cout << "Enter two primes: ";
    cin >> prime1 >> prime2;
    ll N = prime1 * prime2;
    ll phi = (prime1 - 1) * (prime2 - 1);
    ll E = 2;
    while (E < phi)
    {
        if (gcd(phi, E) == 1)
            break;
        else
            E++;
    }
    cout<<"Public key= "<<E<<endl;
    ll K = 0, D;
    while (1)
    {
        if ((1 + (K * phi)) % E == 0)
        {
            D = (1 + (K * phi)) / E;
            break;
        }
        else
            K++;
    }
    ll Massage;
    cout << "Enter your massage: ";
    cin >> Massage;
    cout<<"Private key= "<<D<<endl;
    ll Encrypt = fmod(pow(Massage, E), N);
    cout << "Encrypted massage: " <<fmod(pow(Massage, E),N) << endl;
    cout << "Decrypted massage: " << fmod(pow(Encrypt, D), N);
}

int gcd(int a, int b)
{
    if (b == 0)
    {
        return a;
    }
    else
        gcd(b, a % b);
}
