#include<bits/stdc++.h>
#include<fstream>
#define ll long long
#define fr(m) for(int i=0; i<m; i++)
#define fro(m) for(int i=1; i<m; i++)
#define frj(m) for(int j=0; j<m; j++)
#define frr(n) for(int i=n; i>=0; i--)
#define frxy(x,y) for(int i=x;i<=y;i++)
#define pb push_back
#define pf push_front
using namespace std;
int main()
{
  srand(time(0));
  fstream file;
  //ofstream out;
  file.open("search_4.txt");
  for(int i=0;i<40000;i++)
  {
    file<<rand()%1000000<<endl;
  }
  
return 0;
}