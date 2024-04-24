
// Game of chomp

#include <iostream>
#include <cstdlib>
using namespace std;
int player1()
{
    int ball;
    cout << "Enter your ball count from <1-4>\n";
    cin >> ball;
    return ball;
}
int main()
{
    cout << "Which postion you want to play\n";
    cout << " 1.Player 1 \n 2.Player 2\n";
    cout << "Enter your option <1-2>\n";
    int option;
    cin >> option;
    if (option == 1)
    {
        int remaining = 20;
        while (remaining > 0)
        {
            // cout << " reamnd " << randNum << endl;
            int c1 = player1();
            cout << " You choose " << c1 << endl;
            remaining -= c1;
            int c2 = remaining - (remaining / 5) * 5;
            cout << " Computer choose " << c2 << endl;
            remaining -= c2;
            cout << " remaining ball is " << remaining << endl;
            if (remaining == 0)
                cout << " You lose\n";
        }
    }
    else if (option == 2)
    {

        int remaining = 20;
        while (remaining > 0)
        {
            int c2;
            int diff = remaining - (remaining / 5) * 5;
            if (diff >= 1 && diff <= 4)
            {
                c2 = diff;
            }
            else
                c2 = (rand() % 4) + 1;
            cout << " Computer choose " << c2 << endl;
            // cout << " reamnd " << randNum << endl;
            remaining -= c2;
            cout << " remaining ball is " << remaining << endl;
            if (remaining == 0)
                cout << " You loose\n";
            int c1 = player1();
            cout << " You choose " << c1 << endl;
            remaining -= c1;
            cout << " remaining ball is " << remaining << endl;
            //  int c2 = remaining - (remaining / 5) * 5;

            // remaining -= c2;
            if (remaining == 0)
                cout << " You Win\n";
        }
    }
    else
    {
        cout << " Invalid input \n";
    }
    return 0;
}