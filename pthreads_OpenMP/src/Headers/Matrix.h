//
// Created by Ilya Lyubimov on 12.12.18.
//
#ifndef PTHREADS_OPENMP_MATRIX_H
#define PTHREADS_OPENMP_MATRIX_H

#include <vector>
#include <iostream>
#include <time.h>

using namespace std;

class Matrix {


    const int N;
    const int M;
    vector<vector<double>> data;

public:

    Matrix(const int n, const int m, bool random = false);

    Matrix(const Matrix &other);

    static void *cellCalcThread(void *param);

    Matrix mult(const Matrix &other) const;

    void out();

    Matrix operator=(const Matrix &other);

};


#endif //PTHREADS_OPENMP_MATRIX_H
