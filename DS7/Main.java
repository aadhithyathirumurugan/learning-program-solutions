public class Main {
    public static void main(String[] args) {
        Forecast f = new Forecast();
        double result = f.futureValue(1000, 0.1, 5);
        System.out.println("Future Value: " + result);
    }
}
