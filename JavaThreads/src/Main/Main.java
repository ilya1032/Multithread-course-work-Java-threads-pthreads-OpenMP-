package Main;

public class Main {

    public static void main(String[] args) {
        Matrix A = Matrix.random(3,6);
        Matrix B = Matrix.random(6,3);

        A.out();
        System.out.println("----------");
        B.out();
        System.out.println("----------");
        A.mult(B).out();
        System.out.println("----------");

        double[][] a = {
                {2., 2., 2., 2.},
                {2., 2., 2., 2.},
                {2., 2., 2., 2.},
                {2., 2., 2., 2.}
        };

        double[][] b = {
                {2., 2., 2., 2.},
                {2., 2., 2., 2.},
                {2., 2., 2., 2.},
                {2., 2., 2., 2.}
        };

        A = new Matrix(a);
        B = new Matrix(b);

        A.out();
        System.out.println("----------");
        B.out();
        System.out.println("----------");
        A.mult(B).out();
        System.out.println("----------");
    }
}
