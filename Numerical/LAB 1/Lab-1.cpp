// 1st lab
#include <bits/stdc++.h>
#include <iostream>
#include <fstream>
#include <conio.h>
#define ll long long
#define fr(m) for (int i = 0; i < m; i++)
#define fro(m) for (int i = 1; i < m; i++)
#define frj(m) for (int j = 0; j < m; j++)
#define frr(n) for (int i = n; i >= 0; i--)
#define frxy(x, y) for (int i = x; i <= y; i++)
#define pb push_back
#define pf push_front
using namespace std;
class slove
{
public:
    int n1, n2;
    double a, b;
    int max_iterations = 100;
    double tol;
    vector<int> vec;
    string expres;
    //      slove(){
    //        n1=0;
    //        n2=0;
    //   }
};
class method : public slove
{
public:
    void menu();
    void bisection();
    void f_position();
    void compare();
    double fox(double x);
    double false_position(double a, double b, double tol, int max_iterations);
    void com_bisec();
    void com_false();
};

int main()
{
    method m;
    m.menu();
}

void method::menu()
{
top:
    cout << "\t1.Solve using Bisection method" << endl;
    cout << "\t2.Solve using False Position method" << endl;
    cout << "\t3.Compare two method" << endl;
    cout << "Enter your choice: ";
    int press;
    press = getch();
    cout << endl;
    cout << "Enter a: ";
    cin >> a;
    cout << "Enter b: ";
    cin >> b;
    cout << "Enter the tolerance (e.g., 0.0002): ";
    cin >> tol;
    switch (press)
    {
    case 49:
        method::bisection();
        break;
    case 50:
        method::f_position();
        break;
    case 51:
        method::compare();
    default:
        cout << "select 1-3 \n";
        goto top;
        break;
    }
}

void method::bisection()
{

    cout << endl;
    cout << "n\t  a\t\t  b\t\t  x\t\t  f(x)\t\t       Error" << endl;
    cout << "-----------------------------------------------------------------------------" << endl;

    // Bisection method

    double x_bisection, error_bisection;
    for (int n1 = 1; n1 <= max_iterations; ++n1)
    {
        x_bisection = (a + b) / 2.0;
        error_bisection = fabs(b - a) / 2.0;

        cout << n1 << "\t" << a << "\t\t" << b << "\t\t" << x_bisection << "\t\t" << method::fox(x_bisection) << "\t\t" << error_bisection << endl;

        if (error_bisection < tol)
            break;

        if (method::fox(x_bisection) * method::fox(a) < 0)
            b = x_bisection;
        else
            a = x_bisection;
    }

    cout << "--------------------------------------------------------" << endl;
    cout << "Approximate root using bisection: " << x_bisection << endl;
    method::menu();
}

void method::f_position()
{

    cout << "n\t  a\t\t  b\t\t  x\t\t  f(x)\t\t  Error" << endl;
    cout << "--------------------------------------------------------------------" << endl;

    // False position method
    double x_false_position = method::false_position(a, b, tol, max_iterations);

    if (x_false_position != -1.0)
    {
        cout << "Approximate root using false position: " << x_false_position << endl;
    }
    else
    {
        cout << "False position method did not converge within the maximum number of iterations." << endl;
    }
    method::menu();
}

void method::compare()
{
    method::bisection();
    method::f_position();
    if (n1 > n2)
    {
        cout << "False position method is effective";
    }
    else
    {
        cout << "bisection method is more effective";
    }
}
// void method::input_ex()
// {
//     cout<<"Input your expression:(ex:x3+3x2+x) "<<endl;
//     cin>>expres;
//     for(int i=0;i<expres.size();i++){
//         if(isdigit(expres[i]))
//         vec.push_back(expres[i]-'0');
//     }
//     system("cls");

double method::fox(double x)
{
    return x * x * x - 2 * x - 5;
}

// }
double method::false_position(double a, double b, double tol, int max_iterations)
{
    double x, error;

    for (int n2 = 1; n2 <= max_iterations; ++n2)
    {
        x = (a * method::fox(b) - b * method::fox(a)) / (method::fox(b) - method::fox(a));
        error = fabs(x - a);

        cout << n2 << "\t" << a << "\t\t" << b << "\t\t" << x << "\t\t" << fox(x) << "\t\t" << error << endl;

        if (error < tol)
            return x;

        if (method::fox(x) * fox(a) < 0)
            b = x;
        else
            a = x;
    }

    return -1.0; // Return -1 to indicate failure to converge
}

void method::com_bisec()
{

    // Bisection method
    double x_bisection, error_bisection;
    for (int i = 1; i <= max_iterations; ++i)
    {
        x_bisection = (a + b) / 2.0;
        error_bisection = fabs(b - a) / 2.0;
        if (error_bisection < tol)
            n1 = i;
        break;

        if (method::fox(x_bisection) * method::fox(a) < 0)
            b = x_bisection;
        else
            a = x_bisection;
    }
}

void method::com_false()
{

    double x_false_position = method::false_position(a, b, tol, max_iterations);

    if (x_false_position != -1.0)
    {
        cout << "Approximate root using false position: " << x_false_position << endl;
    }
    else
    {
        cout << "False position method did not converge within the maximum number of iterations." << endl;
    }
}

