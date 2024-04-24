#include <bits/stdc++.h>
using namespace std;
int main()
{
    string st;
    cin >> st;
    int size = st.size() - 1;
    while (1)
    {
        if (st[size - 1] < st[size])
        {
            size--;
            for (int i = st.size(); i > size; i--)
            {
                if (st[size] < st[i])
                {
                    int temp = st[size];
                    st[size] = st[i];
                    st[i] = temp;
                    break;
                }
            }
            for (int i = size + 1; i < st.size(); i++)
            {
                for (int j = i + 1; j < st.size(); j++)
                {
                    if (st[j] < st[i])
                    {
                        int temp = st[j];
                        st[j] = st[i];
                        st[i] = temp;
                    }
                }
            }
            break;
        }
        else
            size--;
    }
    cout<<st;
}
