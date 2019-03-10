#include <iostream>
#include <bits/stdc++.h>
using namespace std;

int main()
{
    ifstream f;
    f.open("sis.txt");
    vector<float> h;
    vector<float> t;
    int n = 0;
    float a;
    float b;
    float H = 2136;
    float G = -0.00767992;
    float g = 9.80665;
    float R = 6371000;
    float aste = -(0.0289647*g)/(8.3144598*G);
    float P = 763.269;
    float T = 265.88365;
    float p = 0;
    float meanE = 0;
    while(f >> a && f >> b){
        n++;
        p = P*pow( (1+(G/T)*(a-H)) ,aste);
        float e = (p-(b))/p;
        //cout << p << " " << b<< " " << (p-b)/p <<endl;
        meanE += abs(e);
    }
    cout << meanE/n*1000 << " " << minE*1000  << " " << maxE*1000 << endl;
    cout << P*pow( (1+(G/T)*(2136-H)) ,aste);


    return 0;
}
