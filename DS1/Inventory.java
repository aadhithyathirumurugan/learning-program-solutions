import java.util.HashMap;

public class Inventory {
    HashMap<Integer, Product> inventory = new HashMap<>();

    void addProduct(Product p) {
        inventory.put(p.productId, p);
    }

    void updateProduct(Product p) {
        inventory.put(p.productId, p);
    }

    void deleteProduct(int productId) {
        inventory.remove(productId);
    }

    void printInventory() {
        for (Product p : inventory.values()) {
            System.out.println(p.productId + " - " + p.productName + " - " + p.quantity + " - $" + p.price);
        }
    }
}
