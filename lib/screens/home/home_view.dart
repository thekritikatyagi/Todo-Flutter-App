import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home_viewmodel.dart';
import 'package:todo_app/screens/home/widgets/home_body.dart';
import 'package:todo_app/screens/view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return Scaffold(
          body: HomeBody(
            homeViewmodel: viewmodel,
          ),
        );
      },
      viewmodel: HomeViewmodel(),
    );
  }
}
