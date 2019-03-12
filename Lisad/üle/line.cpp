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
    float X = 0;
    float Y = 0;
    float grd = 2136;
    while(f >> a && f >> b){
        //f >> a; f >> b;
        //b=b/100;
        cout <<a<< " "<< b <<endl;
        X+=a;Y+=b;
        n++;

        h.push_back(a);
        t.push_back(b);
    }
    X = X/n;
    Y = Y/n;
    //cout << X << " " << Y << endl;
    //cout << n << endl;

    float lug = 0;
    float nim = 0;
    for(int i = 0; i < n; i++){
        lug += (h[i] - X)*(t[i] - Y);
        nim += pow(h[i]-X, 2);
    }
    float beta = lug/nim;
    float alpha = Y - beta*X;
    //cout << endl;
    cout << beta << " "<< alpha<< endl;
    //cout << alpha + beta*grd<< endl;



    return 0;
}
