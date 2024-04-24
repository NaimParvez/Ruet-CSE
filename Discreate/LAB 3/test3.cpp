#include <iostream>
#include <vector>
using namespace std;
int checkA[100000] = {0};
void powerSet(vector<int> ar)
{
    for (int i = 0; i < ar.size(); i++)
    {
        cout << ar[i] << "\n ";
        for (int k = 0; k < ar.size(); k++)
        {
            cout << ar[k] << " ";

            for (int j = k + 1; j < ar.size(); j++)
            {
                cout << ar[j] << " ";
            }
        }

        cout << endl;
    }
}
int main()
{
    cout << "Welcome !\n";

    cout << "Enter the element number of set A \n";
    int n;
    cin >> n;
    cout << "Enter the elements\n";
    vector<int> setA;
    for (int i = 0; i < n; i++)
    {
        int d;
        cin >> d;
        if (checkA[d] == 0)
            setA.push_back(d);
        checkA[d] = 1;
    }
    powerSet(setA);
    return 0;
}
