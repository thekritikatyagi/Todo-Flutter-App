import 'package:flutter/material.dart';
import 'package:todo_app/dependencies/dependency.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/viewmodel.dart';
import 'package:todo_app/services/todo/todo_services.dart';

class SearchViewmodel extends Viewmodel {
  static final SearchViewmodel _instance = SearchViewmodel._internal();
  factory SearchViewmodel() {
    return _instance;
  }

  SearchViewmodel._internal();

  TodoServices get _todoServices => dependency();

  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();

  List<Todo> _todos = [];

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

  String _search = '';
  String get search => _search;
  set search(String value) {
    _search = value;
    turnIdle();
  }

  // fetch specific tasks from parse server
  Future<List<Todo>> getSearchedTasks() async {
    List<Todo> todos = await _todoServices.getAllTodo();
    return todos;
  }
}
