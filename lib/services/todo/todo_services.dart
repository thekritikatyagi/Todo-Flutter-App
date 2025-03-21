import 'package:todo_app/model/todo.dart';

abstract class TodoServices {
  Future<List<Todo>> getAllTodo();
  Future<List<Todo>> getSpecificTodo(String searchWord);
  addNewTask(String title, String description);
  editTask(String title, String description, bool isDone, Todo todo);
  taskCompletion(Todo todos, bool isCompleted);
}
