// number of indegree and outdegree of vertices
#include <bits/stdc++.h>
using namespace std;
int main()
{
    int v;
    cout << "Enter vertices:";
    cin >> v;
    string st[v];
    for (int i = 0; i < v; i++)
    {
        cin >> st[i];
    }
    for (int i = 0; i < st[i].size(); i++)
    {
        cout << "number of outdegree of vertex " << i + 1 << " is " << st[i].size() << endl;
    }
    cout << endl
         << endl;
    int arr[v];
    for (int i = 0; i < v; i++)
    {
        arr[i] = 0;
    }
    for (int i = 0; i < v; i++)
    {
        for (int j = 0; j < st[i].size(); j++)
        {
            ++arr[st[i][j]];
        }
    }
    for (int i = 0; i < v; i++)
    {
        cout << "number of indegree of vertex " << i + 1 << " is " << arr[i] << endl;
    }
}