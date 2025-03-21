import 'package:flutter/material.dart';
import 'package:todo_app/dependencies/dependency.dart';
import 'package:todo_app/screens/viewmodel.dart';
import 'package:todo_app/services/todo/todo_services.dart';

class HomeViewmodel extends Viewmodel {
  static final HomeViewmodel _instance = HomeViewmodel._internal();
  factory HomeViewmodel() {
    return _instance;
  }

  HomeViewmodel._internal();

  TodoServices get _todoServices => dependency();

  bool _isLoading = false;
  bool _isCompleted = false;
  bool _isFirstRun = false;
  int _selectedIndex = 0;
  final formKey = GlobalKey<FormState>();

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    turnIdle();
  }

  bool get isCompleted => _isCompleted;
  set isCompleted(bool value) {
    _isCompleted = value;
    turnIdle();
  }

  bool get isFirstRun => _isFirstRun;
  set isFirstRun(bool value) {
    _isFirstRun = value;
    turnIdle();
  }

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    turnIdle();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // TextEditingController? get titleController => _titleController;

  // set titleController(TextEditingController? value) {
  //   _titleController = value;
  //   turnIdle();
  // }

  // TextEditingController? get descriptionController => _descriptionController;

  // set descriptionController(TextEditingController? value) {
  //   _descriptionController = value;
  //   turnIdle();
  // }

  // add new task
  addtask() async {
    var res = await _todoServices.addNewTask(
        titleController.text, descriptionController.text);
    return res;
  }
}
