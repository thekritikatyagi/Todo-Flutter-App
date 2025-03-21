import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Todo extends ParseObject implements ParseCloneable {
  get title => get("title");
  get description => get("description");
  get isCompleted => get("isCompleted");

  bool isDone = false;

  Todo() : super("Todo");
  Todo.clone() : this();
  @override
  clone(Map<String, dynamic> map) => Todo.clone()..fromJson(map);
}
