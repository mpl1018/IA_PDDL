#include <iostream>
#include <vector>
#include <string>
#include <cmath>

using namespace std;
typedef vector< vector<int> > Matrix;

Matrix random_DAG(int siz, double prob, vector<int>& n_ant, const vector<int>& c) {
    Matrix r(siz, vector<int>(siz, 0));
    for(int i=0; i<r.size(); ++i) {
        for(int j=i+1; j<r[0].size(); ++j) {
            double t = (double) rand()/RAND_MAX;
            if(prob > t) {
                r[i][j] = 1;
                ++n_ant[c[j]];
            }
        }
    }
    return r;
}

void salto_lin(string& f) {
    f += "\n\n";
}

void assign_watched(vector<bool>& w, double prob) {
    for(int i=0; i<w.size(); ++i) {
        double t = (double) rand()/RAND_MAX;
        if(prob > t ) w[i] = true; 
    }
}

void assign_wants(vector<bool>& w, double prob, const vector<bool>& excl) {
    for(int i=0; i<w.size(); ++i) {
        if(not excl[i]) {
            double t = (double) rand()/RAND_MAX;
            if(prob > t) w[i] = true;
        }
    }
}

/*vector<int> compute_n_ant_watched(const vector<bool>& w, const Matrix& M, const vector<int>& c) {
    vector<int> r(w.size(), 0);
    for(int i=0; i<M.size(); ++i) {
        for(int j=0; j<M[0].size(); ++j) {
            if(M[i][j] == 1) { // en este caso i es el antecedente de j
                if(w[c[i]]) ++r[c[j]];
            }
        }
    }
    return r;
}*/

int main() {
    srand(time(NULL));
    int n_media = rand()%10 + 5;                    // random entre 5 y 15
    int siz = rand()%(n_media-4) + 4;               // random entre 4 y n_media
    int n_dias = 5;                                 // numero de dias (por mejorar)

    vector<int> c(n_media);
    vector<bool> aux(n_media, false);
    for(int i=0; i<n_media; ++i) {
        int j = rand()%n_media;
        while(aux[j]) {
            j = rand()%n_media;
        }
        c[i] = j;
        aux[j] = true;
    }

    vector<int> n_ant(n_media, 0);
    Matrix M = random_DAG(siz, 0.3, n_ant, c);                // DAG random que representa relaciones entre medias

    string f = "(define (problem V1Problem) (:domain Redflix)"; // cabecera inicial
    salto_lin(f);                                               // salto de linea de formato
    
    f += "(:objects";
    for(int i=0; i<n_media; ++i) {
        f += " ";
        f += "m";
        f += to_string(i+1);
    }
    f += " - media\n";

    for(int i=0; i<n_dias; ++i) {
        f += "d";
        f += to_string(i);
        f += " ";
    }
    f += "- day )";

    salto_lin(f);

    f += "(:init\n";
    for(int i=0; i<M.size(); ++i) {
        for(int j=0; j<M[0].size(); ++j) {
            if(M[i][j] == 1) {
                f += "    (antecedent m";
                f += to_string(c[i]+1);
                f += " m";
                f += to_string(c[j]+1);
                f += ")\n";
            }
        }
    }

    vector<bool> watched(n_media,false);
    vector<bool> wants(n_media, false);

    assign_watched(watched, 0.2);
    assign_wants(wants, 0.1, watched);

    for(int i=0; i<n_media; ++i) {
        if(wants[i]) {
            f += "    (wantToWatch m";
            f += to_string(i+1);
            f += ")\n";
        }
    }

    for(int i=0; i<n_media; ++i) {
        if(watched[i]) {
            f += "    (watched m";
            f += to_string(i+1);
            f += ")\n";
        }
    }

    
    /*for(int i=0; i<n_media; ++i) {
        f += "    (= (numAntecedents m";
        f += to_string(i+1);
        f += ") ";
        f += to_string(n_ant[i]);
        f += ")\n";
    }

    vector<int> n_ant_watched = compute_n_ant_watched(watched, M, c);

   for(int i=0; i<n_media; ++i) {
        f += "    (= (numAntecedentsAssignedOrWatched m";
        f += to_string(i+1);
        f += ") ";
        f += to_string(n_ant_watched[i]);
        f += ")\n";
    }*/

    for(int i=0; i<n_dias; ++i) {
        f += "    (= (dayNum d";
        f += to_string(i);
        f += ") ";
        f += to_string(i);
        f += ")\n";
    }

  /*  for(int i=0; i<n_media; ++i) {
        f += "    (= (lastDayAntecedentAssignment m";
        f += to_string(i+1);
        f += ") -1)\n";
    }*/

    f += ")";
    salto_lin(f);

    f += 
    "(:goal (and (forall (?x - media) (imply (wantToWatch ?x) (mediaAsigned ?x)))))";

    salto_lin(f);

    f += ")";

    cout << f << endl;
}