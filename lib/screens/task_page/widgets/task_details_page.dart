import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/custom_button.dart';
import 'package:todo_app/common/error_alert_popup.dart';
import 'package:todo_app/common/list_title_deco.dart';
import 'package:todo_app/common/success_alert_popup.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/home/home_view.dart';
import 'package:todo_app/screens/task_page/task_page_viewmodel.dart';
import 'package:todo_app/screens/task_page/widgets/task_edit_page.dart';
import 'package:todo_app/screens/view.dart';

class TaskDetailsPage extends StatelessWidget {
  final Todo todo;
  final TaskPageViewmodel viewmodel;
  const TaskDetailsPage({Key? key, required this.todo, required this.viewmodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return View(
      viewmodel: viewmodel,
      builder: (_, viewmodel, __) => Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Details",
                  style: theme.textTheme.headline2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Your task details!",
                  style: theme.textTheme.bodyText2,
                ),
                const SizedBox(height: 50),
                Text(
                  "Title",
                  style: theme.textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                ListTileDeco(
                  child: ListTile(
                    title: Text(
                      todo.title,
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Description",
                  style: theme.textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListTileDeco(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        todo.description,
                        style: theme.textTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      buttonText: "Edit",
                      buttonColor: theme.colorScheme.primary,
                      onPressed: () => Get.to(
                        () => TaskEditPage(
                          todo: todo,
                          viewmodel: viewmodel,
                        ),
                      ),
                      textStyle: theme.textTheme.button,
                    ),
                    viewmodel.isLoading != true
                        ? CustomButton(
                            buttonText: "Delete",
                            buttonColor: theme.colorScheme.background,
                            onPressed: () => delete(context),
                            textStyle: theme.textTheme.button!.copyWith(
                              color: theme.colorScheme.error,
                            ),
                          )
                        : CustomButton(
                            buttonText: "Loading,,,",
                            buttonColor: theme.colorScheme.background,
                            onPressed: () {},
                            textStyle: theme.textTheme.button!.copyWith(
                              color: theme.colorScheme.error,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  delete(context) async {
    viewmodel.isLoading = true;
    var res = await todo.delete();
    if (res.success) {
      viewmodel.isLoading = false;

      showDialog(
        context: context,
        builder: (context) => SuccessAlertPopUp(
          successText: "Successfully deleted the task!",
          onPressed: () => Get.to(
            () => const HomeView(),
            preventDuplicates: false,
          ),
        ),
      );
    } else {
      viewmodel.isLoading = false;

      showDialog(
        context: context,
        builder: (context) => ErrorAlertPopUp(
          errorText: "Failed to delete task!",
          onPressed: () => Get.to(
            () => const HomeView(),
            preventDuplicates: false,
          ),
        ),
      );
    }
  }
}
