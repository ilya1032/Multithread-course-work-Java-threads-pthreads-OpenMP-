#include <iostream>
#include <pthread.h>
#include <cstdlib>
#include "../Headers/Matrix.h"
#include <ctime>

int main() {

    time_t t1 = clock(), t2;
    time_t delta = clock() - t1;

    Matrix A(5000, 1, true);
    Matrix B(1, 10000, true);

    A.out();
    cout << "------" << endl;
    B.out();
    cout << "------" << endl;

    t1 = clock();
    A.multOMP(B);
    t2 = clock() - t1 - delta;

    printf("it took me %f seconds to calc with OMP\n", float(t2)/CLOCKS_PER_SEC);

    t1 = clock();
    A.mult(B);
    t2 = clock() - t1 - delta;

    printf("it took me %f seconds to calc with pthreads\n", float(t2)/CLOCKS_PER_SEC);

    return 0;
}