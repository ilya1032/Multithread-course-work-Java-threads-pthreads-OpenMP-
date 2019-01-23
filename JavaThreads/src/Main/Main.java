package Main;

public class Main {

    public static void main(String[] args) {
        Matrix A = Matrix.random(5000,50);
        Matrix B = Matrix.random(50,1000);

 /*       A.out();
        System.out.println("----------");
        B.out();
        System.out.println("----------");*/
        long start = System.currentTimeMillis();
        Matrix C = A.mult(B);
        long finish = System.currentTimeMillis();
        long timeConsumedMillis = finish - start;
        Matrix D = A.multOneThread(B);
        System.out.println("----------\nCheck results = " + D.equals(C));

        System.out.println("timeConsumedMillis = " + timeConsumedMillis);
        System.out.println("----------");

    }
}
