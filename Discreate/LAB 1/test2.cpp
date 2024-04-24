#include <iostream>
#include <vector>
using namespace std;

int main()
{

    int n, m;
    cout << "Enter the number of domain x: \n";
    cin >> n;
    cout << "Enter the values of domain x:  " << endl;
    vector<int> arrx(n);
    for (int i = 0; i < n; i++)
    {
        int d;
        cin >> d;
        arrx[i] = d;
        // arrx.push_back(d);
    }
    cout << "Enter the number of domain y: \n";
    cin >> m;
    vector<int> arry(m);
    cout << "Enter the values of domain y:  " << endl;
    for (int i = 0; i < m; i++)
    {
        int d;
        cin >> d;
        arry[i] = d;
        // arrx.push_back(d);
    }
    int flag = 0;
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {
            // cout << arrx[j] + arry[i] << endl;
            if (arrx[j] + arry[i] > 0)
            {
                flag = 1;
                continue;
            }
            else
            {
                flag = 0;
                break;
            }
        }
        if (flag == 1)
            break;
    }
    if (flag == 1)
        cout << "The Value of equation is true " << endl;
    else
        cout << "The Value of equation is false" << endl;
    return 0;
}
