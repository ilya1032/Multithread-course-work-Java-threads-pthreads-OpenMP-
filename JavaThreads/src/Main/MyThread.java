package Main;

public class MyThread extends Thread {
    private final double[][] A;
    private final double[][] B;
    private static Matrix C;
    private final int col;
    private final int row;

    MyThread(double[][] m1, double[][] m2, Matrix resMat, int column, int row){
        A = m1;
        B = m2;
        C = resMat;
        col = column;
        this.row = row;
    }

    public void run(){
        for (int k = 0; k < A[0].length; k++) {
            if (C.getData()[col][row] != 0)
                C.setData(col, row, C.getData()[col][row] + (A[col][k] * B[k][row]));
            else
                C.setData(col, row, A[col][k] * B[k][row]);
        }
    }
}
