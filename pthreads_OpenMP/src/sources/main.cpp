#include <iostream>
#include <pthread.h>
#include <cstdlib>
#include "../Headers/Matrix.h"

int main() {

    int x;

    Matrix A(3,6, true);
    Matrix B(6,3, true);

    A.out();
    cout<<"------"<<endl;
    B.out();
    cout<<"------"<<endl;
    A.mult(B).out();
    cout<<"------"<<endl;

    cout<<"Press any key to continue...";
    cin.get();

    return 0;
}