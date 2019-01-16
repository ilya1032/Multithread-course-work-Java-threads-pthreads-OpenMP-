package Main;

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
        for (int i = 0; i < threadCount; i++) {
            MyThread r = new MyThread(this.getData(), A.getData(), C, i, threadCount);
            new Thread(r, "Calculating").run();
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

}