// taking input as adjacency list and output as adjacency matrix of a graph
 #include<bits/stdc++.h>
#include <iostream>
using namespace std;
int main()
{
    int v;
    cout << "Enter number of vertices: ";
    cin >> v;
    string st[v];
    cout << "Enter edges as adjacency :" << endl;
    for (int i = 0; i < v; i++)
    {
        cin >> st[i];
    }
    int arr[v][v];
    for (int i = 0; i < v; i++)
    {
        for (int j = 0; j < v; j++)
        {
            arr[i][j] = 0;
        }
    }
    // for (int i = 0; i < v; i++)
    // {
    //     for (int j = 0; j < v; j++)
    //     {
    //         cout << arr[i][j] << " ";
    //     }
    //     cout << endl;
    // }
    for (int i = 0; i < v; i++)
    {
        for (int j = 0; j < st[i].size(); j++)
        {
            arr[i][st[i][j]-1-'0'] = 1;
        }
    }
    for (int i = 0; i < v; i++)
    {
        for (int j = 0; j < v; j++)
        {
            cout << arr[i][j] << " ";
        }
        cout << endl;
    }
}