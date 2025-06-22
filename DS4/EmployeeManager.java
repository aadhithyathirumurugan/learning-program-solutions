public class EmployeeManager {
    Employee[] employees = new Employee[100];
    int count = 0;

    void addEmployee(Employee e) {
        employees[count++] = e;
    }

    Employee searchEmployee(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].employeeId == id) return employees[i];
        }
        return null;
    }

    void deleteEmployee(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].employeeId == id) {
                for (int j = i; j < count - 1; j++)
                    employees[j] = employees[j + 1];
                employees[--count] = null;
                break;
            }
        }
    }

    void traverseEmployees() {
        for (int i = 0; i < count; i++) {
            System.out.println(employees[i].employeeId + " - " + employees[i].name);
        }
    }
}
