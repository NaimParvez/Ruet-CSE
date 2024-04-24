#include <iostream>
using namespace std;
void find_prime(int num, int arr[]);
bool if_prime(int num);
int k = 0;
int main()
{
    int num;
    cout << "Enter a number: ";
    cin >> num;
    cout << "prime factorization : ";
    if (if_prime(num))
    {
        cout << num;
    }
    else
    {
        int arr[num / 2];
        find_prime(num, arr);

        while (1)
        {
            for (int i = 0; i < k; i++)
            {
                if (num % arr[i] == 0)
                {
                    cout << arr[i] << " ";
                    num /= arr[i];
                    break;
                }
            }
            if (if_prime(num))
            {
                cout << num;
                break;
            }
        }
    }
}
void find_prime(int num, int arr[])
{
    arr[k++] = 2;
    arr[k++] = 3;
    for (int i = 4; i <= num; i++)
    {
        int flag = 0;
        for (int j = 2; j <= i / 2; ++j)
        {
            if (i % j == 0)
            {
                flag = 1;
                break;
            }
        }
        if (flag == 0)
        {
            arr[k++] = i;
        }
    }
}
bool if_prime(int num)
{
    bool is_prime = true;
    if (num == 0 || num == 1)
    {
        is_prime = false;
    }

    for (int i = 2; i <= num / 2; ++i)
    {
        if (num % i == 0)
        {
            is_prime = false;
            break;
        }
    }
    return is_prime;
}
