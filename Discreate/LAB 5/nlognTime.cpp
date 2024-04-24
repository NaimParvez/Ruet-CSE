#include <bits/stdc++.h>
#include <fstream>

void quickSort(int arr[], int low, int high);
int partition(int arr[], int low, int high);
void swap(int *a, int *b);
using namespace std;
int main()
{
  ofstream myfile;
  myfile.open("nlogn.txt");
  int i = 0;

  while (i < 10000)
  {
    myfile << rand() << endl;
    i++;
  }

  ifstream inputFile("nlogn.txt");
  int num;
  int arr[10000];
  for (i = 0; i < 10000; i++)
  {
    inputFile >> arr[i];
  }
  myfile.close();
  clock_t t1, t2, Time;
  t1 = clock();
  for (i = 0; i < 10000; i++)

    quickSort(arr, 0, 10000 - 1);
  t2 = clock();
  Time = t2 - t1;
  cout << Time << endl;
}

void swap(int *a, int *b)
{
  int t = *a;
  *a = *b;
  *b = t;
}

int partition(int arr[], int low, int high)
{

  int pivot = arr[high];

  int i = (low - 1);

  for (int j = low; j <= high - 1; j++)
  {

    if (arr[j] < pivot)
    {

      i++;
      swap(&arr[i], &arr[j]);
    }
  }
  swap(&arr[i + 1], &arr[high]);
  return (i + 1);
}

void quickSort(int arr[], int low, int high)
{
  if (low < high)
  {

    int pi = partition(arr, low, high);
    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}
