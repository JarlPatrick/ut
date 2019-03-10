#include <bits/stdc++.h>
using namespace std;

int line(vector<float> Xa, vector<float> Ya, int n){
    float lug = 0; float nim = 0;
    float X = 0; float Y = 0;
    for(int i = 0; i < n; i++){
        if(true){
            X+=Xa[i]; Y+=Ya[i];
        }
    }
    X = X/n; Y = Y/n;
    for(int i = 0; i < n; i++){
        if(true){
            lug += (Xa[i] - X)*(Ya[i] - Y);
            nim += pow(Xa[i]-X, 2);
        }
    }
    float beta = lug/nim;
    float alpha = Y - beta*X;
    cout << beta << " "<< alpha<< endl;
    //y = x*beta + alpha
}

int pre(vector<float> Xa, vector<float> Ya, int n){
    float L = -0.00767992; float g = 9.80665; float R = 8.3144598; float mu = 0.0289647;
    float aste = -(mu*g)/(R*L);
    float meanE = 0;
    float P = 763.269; float T = 265.88365; float p = 0; float H = 2136;
    for(int i = 0; i < n; i++){
        p = P*pow( (1+(L/T)*(Xa[i]-H)) ,aste);
        float e = (p-Ya[i])/p;
        meanE += abs(e);
    }
    float er = meanE/n*1000;
}

int main(){
    ifstream fi; ofstream fo;
    fi.open("log.txt"); fo.open("sis.txt");
    string A; int B; string C; float D; float E; float F; int G; float H; float I; float J; float K; string L;
    vector<float>nr;vector<float>time;vector<float>lat;vector<float>lon;vector<float>height;vector<float>itemp;vector<float>otemp;vector<float>pre;vector<float>hum;
    float n = 0; int T = 0;
    while(fi >> A){
        n++;
        fi>>B;fi>>C;fi>>D;fi>>E;fi>>F;fi>>G;fi>>H;fi>>I;fi>>J;fi>>K;fi>>L;
        nr.push_back(B);
        int t=36000*C[0]+3600*C[1]+600*C[3]+60*C[4]+10*C[6]+C[7]-1933008;
        if(n == 1){T = t;}
        time.push_back(t-T);
        lat.push_back(D);
        lon.push_back(E);
        height.push_back(F);
        itemp.push_back(H);
        otemp.push_back(I);
        pre.push_back(J);
        hum.push_back(K);
    }

    line(height,otemp,n);

    return 0;
}
