import 'package:flutter/material.dart';
import 'package:todo_app/dependencies/dependency.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/viewmodel.dart';
import 'package:todo_app/services/todo/todo_services.dart';

class TaskPageViewmodel extends Viewmodel {
  static final TaskPageViewmodel _instance = TaskPageViewmodel._internal();
  factory TaskPageViewmodel() {
    return _instance;
  }

  TodoServices get _todoServices => dependency();

  TaskPageViewmodel._internal();
  final formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  List<Todo> _todos = [];
  bool _isDone = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    turnIdle();
  }

  List<Todo> get todos => _todos;
  set todos(List<Todo> value) {
    _todos = value;
    turnIdle();
  }

  bool get isDone => _isDone;
  set isDone(bool value) {
    _isDone = value;
    turnIdle();
  }

  // fetch all tasks from parse server
  Future<List<Todo>> getAllTasks() async {
    List<Todo> todos = await _todoServices.getAllTodo();
    return todos;
  }

  // update tasks
  updateTasks(Todo todo) {
    var res = _todoServices.editTask(
      titleController.text,
      descriptionController.text,
      isDone,
      todo,
    );
    return res;
  }

  // update task completion
  updateTaskCompletion(Todo todo) {
    var res = _todoServices.taskCompletion(todo, isDone);
    return res;
  }
}
