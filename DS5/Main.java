public class Main {
    public static void main(String[] args) {
        TaskManager tm = new TaskManager();

        tm.addTask(new Task(1, "Design", "Pending"));
        tm.addTask(new Task(2, "Develop", "In Progress"));
        tm.traverseTasks();
        tm.deleteTask(1);
        tm.traverseTasks();
    }
}
