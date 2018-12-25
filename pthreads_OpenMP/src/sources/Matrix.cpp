//
// Created by Ilya Lyubimov on 12.12.18.
//

#include "../Headers/Matrix.h"
#include <unistd.h>
#include <omp.h>

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

    vector<void *> temp = *reinterpret_cast< vector<void *> * >(param);

    int *n = reinterpret_cast<int *>(temp.at(0));
    int *m = reinterpret_cast<int *>(temp.at(1));
    Matrix *A = reinterpret_cast<Matrix *>(temp.at(2));
    Matrix *B = reinterpret_cast<Matrix *>(temp.at(3));
    Matrix *C = reinterpret_cast<Matrix *>(temp.at(4));
    while (*n < (C->M * C->N)) {
        for (int k = 0; k < A->M; k++) {
            C->data.at(*n / C->M).at(*n % C->N) += A->data.at(*n / C->M).at(k) * B->data.at(k).at(*n % C->N);
        }

        *n += *m;

        if (*n > (C->M * C->N))
            break;
    }
    delete n;
    delete param;
    pthread_exit(nullptr);
}

Matrix Matrix::mult(const Matrix &other) const {
    Matrix C(N, other.M);
    int threadCount = (C.N * C.M) > MAX_THREAD_COUNT ? MAX_THREAD_COUNT : (C.N * C.M);
    pthread_t arr[threadCount];
    for (int i = 0; i < threadCount; i++) {
        vector<void *> *param = new vector<void *>(
                {(void *) new int(i), (void *) &threadCount, (void *) this, (void *) &other, (void *) &C});
        if (pthread_create(&arr[i], nullptr, cellCalcThread, param) != 0)
            throw new runtime_error("pthread_create() error");
    }
    for (int i = 0; i < threadCount; i++)
        pthread_join(arr[i], nullptr);
    return C;
}


Matrix Matrix::multOMP(const Matrix &other) const {
    Matrix C(N, other.M);
    int i = 0, j = 0, k = 0;
    omp_set_num_threads((C.N * C.M) > MAX_THREAD_COUNT ? MAX_THREAD_COUNT : (C.N * C.M));
#pragma omp parallel
    {
#pragma omp for
        for (i = 0; i < N; i++) {
            for (j = 0; j < other.M; j++) {
                double dot = 0;
                for (k = 0; k < M; k++) {
#pragma omp atomic
                    dot += data.at(i).at(k) * other.data.at(k).at(j);
                }
                C.data.at(i).at(j) = dot;
            }
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
