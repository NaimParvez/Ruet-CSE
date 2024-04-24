#include <bits/stdc++.h>
using namespace std;
int main()
{
    int n;
    cout << "Enter no of element of set A: ";
    cin >> n;
    vector<int> seta[n];
    int ele;
    cout << "Enter element of set A:";
    for (int i = 0; i < n; i++)
    {
        cin >> ele;
        seta->push_back(ele);
    }
    cout << "Enter no of element of set B: ";
    cin >> n;
    vector<int> setb[n];
    cout << "Enter element of set B:";
    for (int i = 0; i < n; i++)
    {
        cin >> ele;
        setb->push_back(ele);
    }
    vector<int> check(m, 0);
    int result,v=0;;
    for(auto x: seta)
    {
        result=pow(x, 3) - x + 1;
        for(auto y:setb)
        {
            if(x=y)
            {
                check[v++]++;
            }
        }
    }
}