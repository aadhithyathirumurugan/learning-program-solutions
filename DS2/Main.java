import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product(1, "Phone", "Electronics"),
            new Product(2, "Shoes", "Footwear"),
            new Product(3, "Laptop", "Electronics")
        };

        Search search = new Search();

        // Linear search
        Product found = search.linearSearch(products, "Laptop");
        if (found != null) System.out.println("Found (linear): " + found.productName);

        // Binary search (sorted by name)
        Arrays.sort(products, (a, b) -> a.productName.compareToIgnoreCase(b.productName));
        Product found2 = search.binarySearch(products, "Laptop");
        if (found2 != null) System.out.println("Found (binary): " + found2.productName);
    }
}
