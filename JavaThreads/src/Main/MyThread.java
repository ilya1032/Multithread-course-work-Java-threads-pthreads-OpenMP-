package Main;

public class MyThread extends Thread {
    private final double[][] A;
    private final double[][] B;
    private static Matrix C;
    private int i;
    private final int c;

    MyThread(double[][] m1, double[][] m2, Matrix resMat, int first, int last) {
        A = m1;
        B = m2;
        C = resMat;
        i = first;
        c = last;
    }

    public void run() {
        for (int j = i; j < c; j++) {
            int col = j / C.getData()[0].length;
            int row = j % C.getData()[0].length;
            for (int k = 0; k < A[0].length; k++) {
                if (C.getData()[col][row] != 0)
                    C.setData(col, row, C.getData()[col][row] + (A[col][k] * B[k][row]));
                else
                    C.setData(col, row, A[col][k] * B[k][row]);
            }
        }
    }
}
