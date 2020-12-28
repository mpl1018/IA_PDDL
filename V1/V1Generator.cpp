#include <iostream>
#include <vector>
#include <string>
#include <cmath>

using namespace std;
typedef vector< vector<int> > Matrix;

Matrix random_DAG(int siz, double prob) {
    Matrix r(siz, vector<int>(siz, 0));
    for(int i=0; i<r.size(); ++i) {
        for(int j=i+1; j<r[0].size(); ++j) {
            float t = (float) rand()/RAND_MAX;
            if(prob > t) r[i][j] = 1;
        }
    }
    return r;
}


int main() {
    srand(time(NULL));
    int n_media = rand()%20 + 1;
    int siz = rand()%n_media + 4;

    cout << n_media << endl;

    Matrix M = random_DAG(siz, 0.3);

    for(int i=0; i<M.size(); ++i) {
        for(int j=0; j<M[0].size(); ++j) {
            cout << M[i][j] << " ";
        }
        cout << endl;
    }
}