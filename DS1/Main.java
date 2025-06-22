public class Main {
    public static void main(String[] args) {
        Inventory inv = new Inventory();

        Product p1 = new Product(1, "Laptop", 10, 999.99);
        Product p2 = new Product(2, "Monitor", 5, 199.99);

        inv.addProduct(p1);
        inv.addProduct(p2);
        inv.updateProduct(new Product(1, "Laptop", 8, 999.99));
        inv.deleteProduct(2);

        inv.printInventory();
    }
}
