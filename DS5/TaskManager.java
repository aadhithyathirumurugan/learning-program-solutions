public class TaskManager {
    Task head = null;

    void addTask(Task task) {
        if (head == null) {
            head = task;
        } else {
            Task temp = head;
            while (temp.next != null) temp = temp.next;
            temp.next = task;
        }
    }

    Task searchTask(int id) {
        Task temp = head;
        while (temp != null) {
            if (temp.taskId == id) return temp;
            temp = temp.next;
        }
        return null;
    }

    void deleteTask(int id) {
        if (head == null) return;
        if (head.taskId == id) {
            head = head.next;
            return;
        }
        Task temp = head;
        while (temp.next != null) {
            if (temp.next.taskId == id) {
                temp.next = temp.next.next;
                return;
            }
            temp = temp.next;
        }
    }

    void traverseTasks() {
        Task temp = head;
        while (temp != null) {
            System.out.println(temp.taskId + " - " + temp.taskName + " - " + temp.status);
            temp = temp.next;
        }
    }
}
