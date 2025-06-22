import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Book[] books = {
            new Book(1, "Java Programming", "Smith"),
            new Book(2, "Python Basics", "John"),
            new Book(3, "C++ Fundamentals", "Jane")
        };

        LibrarySearch search = new LibrarySearch();

        // Linear search
        Book b1 = search.linearSearch(books, "Python Basics");
        if (b1 != null) System.out.println("Found: " + b1.title);

        // Binary search
        Arrays.sort(books, (a, b) -> a.title.compareToIgnoreCase(b.title));
        Book b2 = search.binarySearch(books, "Python Basics");
        if (b2 != null) System.out.println("Found (Binary): " + b2.title);
    }
}
