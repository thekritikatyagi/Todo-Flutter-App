import 'package:get_it/get_it.dart';
import 'package:todo_app/services/todo/todo_service_parse.dart';
import 'package:todo_app/services/todo/todo_services.dart';

GetIt dependency = GetIt.instance;

void init() {
  // dependency injection
  dependency.registerLazySingleton<TodoServices>(() => TodoServicesParse());
}
