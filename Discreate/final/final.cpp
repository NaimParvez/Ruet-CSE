#include <bits/stdc++.h>
using namespace std;
int main()
{
    int n;
    cout << "enter number of element of set a ";
    cin >> n;
    int arr1[n];
    cout << "enter set a ";
    for (int i = 0; i < n; i++)
    {
        cin >> arr1[i];
    }
    int m;
    cout << "enter number of element of set b ";
    cin >> m;
    int arr2[n];
    cout << "enter set b ";
    for (int i = 0; i < m; i++)
    {
        cin >> arr2[i];
    }
    int count[m];
    for (int i = 0; i < m; i++)
    {
        count[i] = 0;
    }
    int result;
    for (int i = 0; i < n; i++)
    {
        int flag = 0;
        result = pow(arr1[i], 3) - arr1[i] + 1;
        for (int j = 0; j < m; j++)
        {
            if (result == arr2[j])
            {
                count[j]++;
                flag = 1;
                break;
            }
        }
        if (flag == 0)
        {
            cout << "not function" << endl;
            return 0;
        }
    }
    int mark = 0, mark2 = 0;
    for (int i = 0; i < m; i++)
    {
        if (count[i] > 1)
        {
            mark = 1;
        }
        if (count[i] == 0)
        {
            mark2 = 1;
        }
    }
    if (mark == 1)
    {
        cout << "Not one to one" << endl;
    }
    else
    {
        cout << "one to one" << endl;
    }
    if (mark2 == 1)
    {
        cout << "Not onto" << endl;
    }
    else
    {
        cout << "onto" << endl;
    }
}