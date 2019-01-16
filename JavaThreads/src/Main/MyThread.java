package Main;

public class MyThread extends Thread {
    private final double[][] A;
    private final double[][] B;
    private static Matrix C;
    private int i;
    private final int c;

    MyThread(double[][] m1, double[][] m2, Matrix resMat, int index, int threadCount){
        A = m1;
        B = m2;
        C = resMat;
        i = index;
        c = threadCount;
    }

    public void run(){
        while (i < C.getData().length * C.getData()[0].length) {
            for (int k = 0; k < A[0].length; k++) {
                if (C.getData()[i / C.getData().length][i % C.getData()[0].length] != 0)
                    C.setData(i / C.getData().length, i % C.getData()[0].length,
                            C.getData()[i / C.getData().length][i % C.getData()[0].length] +
                                    (A[i / C.getData().length][k] * B[k][i % C.getData()[0].length]));
                else
                    C.setData(i / C.getData().length, i % C.getData()[0].length,
                            A[i / C.getData().length][k] * B[k][i % C.getData()[0].length]);
            }
            i += c;

            if (i > C.getData().length * C.getData()[0].length)
                break;
        }
    }
}
