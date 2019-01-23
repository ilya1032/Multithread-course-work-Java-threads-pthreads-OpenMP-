package Main;

import java.util.ArrayList;

public class Matrix {

    private final int N;
    private final int M;
    private final double[][] data;
    private final int MAX_THREAD_COUNT = 150;

    public Matrix(int N, int M) {
        this.N = N;
        this.M = M;
        data = new double[N][M];
    }

    public static Matrix random(int N, int M) {
        Matrix A = new Matrix(N, M);
        for (int i = 0; i < N; i++)
            for (int j = 0; j < M; j++)
                A.data[i][j] = (int) (Math.random() * 10);
        return A;
    }

    public Matrix(double[][] data) {
        N = data.length;
        M = data[0].length;
        this.data = new double[N][M];
        for (int i = 0; i < N; i++)
            for (int j = 0; j < M; j++)
                this.data[i][j] = data[i][j];
    }

    private Matrix(Matrix A) {
        this(A.data);
    }

    public Matrix mult(Matrix A) {
        if (this.M != A.N)
            throw new RuntimeException("Multiplication impossible due to different matrix dimensions");
        Matrix C = new Matrix(this.N, A.M);
        int threadCount = (C.N * C.M) > MAX_THREAD_COUNT ? MAX_THREAD_COUNT : (C.N * C.M);
        ArrayList<Thread> threads = new ArrayList<>(threadCount);
        int div = (C.N * C.M) / threadCount;
        int mod = (C.N * C.M) % threadCount;
        int first = 0;
        for (int i = 0; i < threadCount; i++) {
            int last = first + div;
            if (mod > 0) {
                last++;
                mod--;
            }
            MyThread r = new MyThread(this.getData(), A.getData(), C, first, last);
            Thread t = new Thread(r, "Calculating");
            threads.add(t);
            t.run();
            first = last;
        }
        for (Thread thread : threads) {
            try {
                thread.join();
            } catch (InterruptedException e) {
            }
        }
        return C;
    }

    public Matrix multOneThread(Matrix A) {
        if (this.M != A.N) throw new RuntimeException("Multiplication impossible due to different matrix dimensions");
        Matrix C = new Matrix(this.N, A.M);
        for (int i = 0; i < this.N; i++)
            for (int j = 0; j < A.M; j++)
                for (int k = 0; k < this.M; k++) {
                    if (C.data[i][j] != 0)
                        C.data[i][j] += (this.data[i][k] * A.data[k][j]);
                    else
                        C.data[i][j] = (this.data[i][k] * A.data[k][j]);
                }
        return C;
    }

    public void out() {
        for (int i = 0; i < this.N; i++) {
            for (int j = 0; j < this.M; j++)
                System.out.printf("%.3f ", (float) this.data[i][j]);
            System.out.printf("\n");
        }
    }

    public double[][] getData() {
        return data;
    }

    public void setData(int i, int j, double data) {
        if (i > this.N || j > this.M) throw new RuntimeException("Wrong dimensions. Failed to set data");
        this.data[i][j] = data;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        Matrix K = (Matrix) obj;
        if (K.N != this.N || K.M != this.M)
            return false;
        for (int i = 0; i < this.N; i++) {
            for (int j = 0; j < this.M; j++)
                if (K.getData()[i][j] != this.getData()[i][j])
                    return false;
        }

        return true;
    }

}