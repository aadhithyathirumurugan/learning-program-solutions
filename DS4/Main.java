public class Main {
    public static void main(String[] args) {
        EmployeeManager em = new EmployeeManager();

        em.addEmployee(new Employee(1, "Alice", "Manager", 60000));
        em.addEmployee(new Employee(2, "Bob", "Engineer", 50000));
        em.traverseEmployees();
        em.deleteEmployee(1);
        em.traverseEmployees();
    }
}
