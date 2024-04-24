#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int checkA[100000] = {0};
int checkB[100000] = {0};
int oneA[100000] = {0};
int oneB[100000] = {0};
int oneC[100000] = {0};

vector<int> range1;
vector<int> range2;
vector<int> range3;
vector<int> setA, setB;

void getRange1()
{
    int flag = 1;
    for (int i = 0; i < setA.size(); i++)
    {
        int val = abs(setA[i] * setA[i]) + 1;
        // cout << val << endl;
        if (oneA[val] == 1)
        {
            flag = 0;
        }
        range1.push_back(val);
        oneA[val] = 1;
    }
    sort(range1.begin(), range1.end());
    sort(setB.begin(), setB.end());
    if (flag == 1)
        cout << "fn1 is one one \n";
    else
        cout << "fn1 is not one one\n";
    int f = 0;
    cout << setB.size() << " " << range1.size() << endl;
    if (range1.size() == setB.size())
    {
        // cout << "ee\n";
        for (int i = 0; i < range1.size(); i++)
        {
            if (range1[i] == setB[i])
            {
                continue;
            }
            else
            {
                f = 1;
                break;
            }
        }
    }
    else
        f = 1;
    if (f == 0)
        cout << "fn1 is onto\n";
    else
        cout << "fn1 is not onto\n";
    // for (int)
}
void getRange2()
{
    int flag = 1;
    for (int i = 0; i < setA.size(); i++)
    {
        int x = setA[i];
        int val = (x * x * x) + (x * x) - x + 1;
        if (oneB[val] == 1)
        {
            flag = 0;
        }
        oneB[val] = 1;
        range2.push_back(val);
    }
    sort(range2.begin(), range2.end());
    sort(setB.begin(), setB.end());
    int f = 0;
    if (flag == 1)
        cout << "fn2 is one one \n";
    else
        cout << "fn2 is not one one\n";
    if (range2.size() == setB.size())
    {
        for (int i = 0; i < range2.size(); i++)
        {
            if (range2[i] == setB[i])
            {
                continue;
            }
            else
            {
                f = 1;
                break;
            }
        }
    }
    else
        f = 1;
    if (f == 0)
        cout << "fn2 is onto\n";
    else
        cout << "fn2 is not onto\n";
}
void getRange3()
{
    int flag = 1;
    for (int i = 0; i < setA.size(); i++)
    {
        int x = setA[i];
        int val = (x * x * x * x * x) - (x * x) + x;
        if (oneA[val] == 1)
        {
            flag = 0;
        }
        oneC[val] = 1;
        range3.push_back(val);
    }
    sort(range3.begin(), range3.end());
    sort(setB.begin(), setB.end());
    int f = 0;
    if (flag == 1)
        cout << "fn3 is one one \n";
    else
        cout << "fn3 is not one one\n";
    if (range3.size() == setB.size())
    {
        for (int i = 0; i < range3.size(); i++)
        {
            if (range3[i] == setB[i])
            {
                continue;
            }
            else
            {
                f = 1;
                break;
            }
        }
    }
    else
        f = 1;
    if (f == 0)
        cout << "fn1 is onto\n";
    else
        cout << "fn1 is not onto\n";
}

int main()
{
    cout << "Welcome !\n";

    cout << "Enter the element number of set A \n";
    int n;
    cin >> n;
    cout << "Enter the elements\n";
    // vector<int> setA;
    for (int i = 0; i < n; i++)
    {
        int d;
        cin >> d;
        if (checkA[d] == 0)
            setA.push_back(d);
        checkA[d] = 1;
    }
    cout << "Enter the element number of set B \n";
    // int n;
    cin >> n;
    cout << "Enter the elements\n";
    //  vector<int> setB;
    for (int i = 0; i < n; i++)
    {
        int d;
        cin >> d;
        if (checkB[d] == 0)
            setB.push_back(d);
        checkB[d] = 1;
    }
    getRange1();
    getRange2();
    getRange3();
    // for function 1

    return 0;
}
