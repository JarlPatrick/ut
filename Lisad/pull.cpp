#include <bits/stdc++.h>
using namespace std;

int main(){
    ifstream fi; ofstream fo;
    fi.open("log.txt"); fo.open("pull.txt");
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

    for(int i = 0; i < n; i++){
        fo<< "\\addchap{Lisa " << i + 5 << " Andmepunkt number " << i+1 <<"}"<<endl<<endl;
        fo<< "Antud m66tmise indeks on " << nr[i] << endl<<endl;
        fo<< "Antud m66tmine tehti " << time[i]<<" s peale starti" << endl<<endl;
        fo<< "Antud m66tmine tehti laiuskraadil " << lat[i] <<"N ja pikkuskraadil " << lon[i] << "S" << endl<<endl;
        fo<< "Antud m66tmine tehti k6rgusel " << height[i]<<" m merepinnast" << endl<<endl;
        fo<< "Antud m66tmisel m66deti sisetemperatuuriks " << itemp[i]<<" kraadi Celsiust" << endl<<endl;
        fo<< "Antud m66tmisel m66deti välistemperatuuriks " << otemp[i]<<" kraadi Celsiust" << endl<<endl;
        fo<< "Antud m66tmisel m66deti r6huks " << pre[i]<<" hekta paskalit" << endl<<endl;
        fo<< "Antud m66tmisel m66deti 6huniiskuseks " << hum[i]<<" %" << endl<<endl;
    }

    return 0;
}
