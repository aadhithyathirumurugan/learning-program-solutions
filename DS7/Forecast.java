public class Forecast {
    public double futureValue(double currentValue, double rate, int years) {
        if (years == 0) return currentValue;
        return futureValue(currentValue * (1 + rate), rate, years - 1);
    }
}
