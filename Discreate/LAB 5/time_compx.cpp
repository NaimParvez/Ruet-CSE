#include <bits/stdc++.h>
#include <fstream>
using namespace std;

int main()
{
  srand(time(0));
  ofstream myfile;
  myfile.open("data.txt");
  int i = 0;

  while (i < 200000)
  {
    myfile << rand() << endl;
    i++;
  }

  ifstream inputFile("data.txt");
  int num;
  long long arr[200000];
  for (i = 0; i < 200000; i++)
  {
    inputFile >> arr[i];
  }
  myfile.close();
  clock_t t1, t2, Time;
  t1 = clock();
  for (i = 0; i < 200000; i++)
  {
    for (int j = 0; j < 200000; j++)
    {
      if (arr[j] > arr[j + 1])
      {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  t2 = clock();
  Time = t2 - t1;
  cout << Time << endl;
}
