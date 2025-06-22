public class Main {
    public static void main(String[] args) {
        Order[] orders = {
            new Order(1, "Alice", 500.0),
            new Order(2, "Bob", 150.0),
            new Order(3, "Charlie", 300.0)
        };

        Sort sort = new Sort();

        sort.quickSort(orders, 0, orders.length - 1);

        for (Order o : orders) {
            System.out.println(o.orderId + " - " + o.customerName + " - " + o.totalPrice);
        }
    }
}
