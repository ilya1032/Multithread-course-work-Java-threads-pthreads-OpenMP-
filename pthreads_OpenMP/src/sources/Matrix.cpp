//
// Created by Ilya Lyubimov on 12.12.18.
//

#include "../Headers/Matrix.h"

Matrix::Matrix(const int n, const int m, bool random) : N(n), M(m) {
    data = vector<vector<double >>(N);
    for (int i = 0; i < N; i++) {
        data.at(i) = vector<double>(M, 0);
    }
    if (random) {
        srand(time(0));
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < M; j++) {
                data.at(i).at(j) = rand() % 10 + 1;
            }
        }
    }
}

Matrix::Matrix(const Matrix &other) : N(other.N), M(other.M), data(other.data) {}

void *Matrix::cellCalcThread(void *param) {
    /*
    int *tempI = reinterpret_cast<int *>(param);
    int n = tempI[0];
    int m = tempI[1];
    Matrix *tempM = reinterpret_cast<Matrix *>(&(tempI[2]));
    Matrix A = tempM[0];
    Matrix B = tempM[1];
    Matrix C = tempM[2];
*/
    vector<void*> temp = *reinterpret_cast< vector<void*>* >(param);

    int* n = reinterpret_cast<int*>(temp.at(0));
    int* m = reinterpret_cast<int*>(temp.at(1));
    Matrix* A = reinterpret_cast<Matrix*>(temp.at(2));
    Matrix* B = reinterpret_cast<Matrix*>(temp.at(3));
    Matrix* C = reinterpret_cast<Matrix*>(temp.at(4));

    for (int k = 0; k < A->M; k++) {
        C->data.at(*n).at(*m) += A->data.at(*n).at(k) * B->data.at(k).at(*m);
    }

    delete n;
    delete m;
    delete param;

//    pthread_exit(nullptr);
}

Matrix Matrix::mult(const Matrix &other) const {
    Matrix C(N, other.M);
//    vector<void*>* args = new vector<void*>({(void *) &N, (void *) &other.M, (void *) this, (void *) &other, (void *) &C});
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < other.M; j++) {
            int* i1 = new int(i);
            int* j1 = new int(j);
            vector<void*>* args = new vector<void*>({(void *) i1, (void *) j1, (void *) this, (void *) &other, (void *) &C});
            pthread_t thr;
//            pthread_attr_init(NULL);
            if (pthread_create(&thr, nullptr, cellCalcThread, args) != 0)
                throw std::runtime_error("pthread_create() fail");
//                cellCalcThread(args);
        }
    }
    return C;
}

void Matrix::out() {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            cout << data.at(i).at(j) << ' ';
        }
        cout << endl;
    }
}