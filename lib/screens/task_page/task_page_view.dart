import 'package:flutter/material.dart';
import 'package:todo_app/screens/task_page/task_page_viewmodel.dart';
import 'package:todo_app/screens/task_page/widgets/task_page_body.dart';
import 'package:todo_app/screens/view.dart';

class TaskPageView extends StatelessWidget {
  const TaskPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return Scaffold(
          body: TaskPageBody(
            viewmodel: viewmodel,
          ),
        );
      },
      viewmodel: TaskPageViewmodel(),
    );
  }
}
