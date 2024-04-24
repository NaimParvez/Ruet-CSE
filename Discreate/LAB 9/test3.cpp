// Bipartite check of graph

#include <bits/stdc++.h>
using namespace std;
int main()
{
    int n, m;
    cout << "Enter number of nodes\n";
    cin >> n;
    cout << "enter number of edges\n";
    cin >> m;
    vector<char> color(n + 1, '0');
    vector<int> arr[n + 1];
    cout << "Enter the edges\n";
    for (int i = 0; i < m; i++)
    {
        int c, d;
        cin >> c >> d;
        arr[c].push_back(d);
        arr[d].push_back(c);
    }
    bool isOk = false;
    color[1] = 'R';
    for (int i = 1; i <= n; i++)
    {

        for (int j = 0; j < arr[i].size(); j++)
        {
            if (color[arr[i][j]] != color[i])
            {
                color[arr[i][j]] = color[i] == 'R' ? 'B' : 'R';
            }
            else
            {
                // cout << arr[i][j] << " " << i << endl;
                isOk = true;
                break;
            }
            if (isOk)
            {
                break;
            }
        }
    }

    if (isOk)
        cout << "Not BiPertite\n";
    else
        cout << "Bipertite\n";
}
