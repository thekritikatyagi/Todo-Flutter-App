import 'package:flutter/material.dart';
import 'package:todo_app/screens/search/search_viewmodel.dart';
import 'package:todo_app/screens/search/widgets/search_page_body.dart';
import 'package:todo_app/screens/task_page/task_page_viewmodel.dart';
import 'package:todo_app/screens/view.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: SearchViewmodel(),
      builder: (_, viewmodel, __) {
        return View(
          builder: (_, taskViewmodel, __) {
            return Scaffold(
              body: SearchPageBody(
                viewmodel: viewmodel,
                tViewmodel: taskViewmodel,
              ),
            );
          },
          viewmodel: TaskPageViewmodel(),
        );
      },
    );
  }
}
