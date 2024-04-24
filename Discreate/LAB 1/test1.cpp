#include <iostream>
using namespace std;
int negationfn(int val)
{
    // cout << !val << endl;
    return !val;
}
int andfn(int val1, int val2)
{
    return val1 & val2;
}
int impliesfn(int val1, int val2)
{
    if (val1 == 0)
        return 1;
    else
    {
        if (val2 == 0)
            return 0;
        else
            return 1;
    }
}
int orfn(int val1, int val2)
{
    return val1 || val2;
}
int main()
{
    int n;
    int val[4][2] = {{0, 0}, {0, 1}, {1, 0}, {1, 1}};
    // cin >> n;
    cout << "Truth Table for equation 1: \n";
    // cout << " " << orfn(1, 1) << endl;
    for (int i = 0; i < 4; i++)
    {
        cout << "p"
             << " "
             << "q"
             << "  "
             << "-p^(p->q)"
             << "                 "
             << "p V (-q->p)\n";
        cout << val[i][0] << " " << val[i][1] << "       " << andfn(negationfn(val[i][0]), impliesfn(val[i][0], val[i][1])) << "                           " << orfn(val[i][0], impliesfn(negationfn(val[i][1]), val[i][0])) << endl;
    }
    //  cout << andfn(1, 1) << endl;
    return 0;
}
