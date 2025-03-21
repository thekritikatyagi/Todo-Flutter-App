import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/error_alert_popup.dart';
import 'package:todo_app/common/list_title_deco.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/home/home_view.dart';
import 'package:todo_app/screens/stateful_wrapper.dart';
import 'package:todo_app/screens/task_page/task_page_viewmodel.dart';
import 'package:todo_app/screens/task_page/widgets/task_details_page.dart';

class TaskPageBody extends StatelessWidget {
  final TaskPageViewmodel viewmodel;
  const TaskPageBody({Key? key, required this.viewmodel}) : super(key: key);

  Future<List<Todo>> getAllTasks() async {
    List<Todo> todos = await viewmodel.getAllTasks();
    return todos;
  }

  onInit() {
    getAllTasks().then((value) => viewmodel.todos = value);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return StatefulWrapper(
      onInit: onInit,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello!",
                  style: theme.textTheme.headline2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "What's your plan today?",
                  style: theme.textTheme.bodyText2,
                ),
                const SizedBox(height: 50),
                viewmodel.todos.isNotEmpty && viewmodel.isLoading == false
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: viewmodel.todos.length,
                        itemBuilder: (context, index) {
                          return ListTileDeco(
                            child: ListTile(
                              onTap: () => Get.to(
                                () => TaskDetailsPage(
                                  todo: viewmodel.todos[index],
                                  viewmodel: viewmodel,
                                ),
                              ),
                              title: Text(
                                viewmodel.todos[index].title,
                                style: theme.textTheme.bodyText1,
                              ),
                              trailing: Checkbox(
                                onChanged: (val) async {
                                  viewmodel.isLoading = true;
                                  viewmodel.isDone = val!;
                                  var res =
                                      await viewmodel.updateTaskCompletion(
                                          viewmodel.todos[index]);
                                  if (res.success) {
                                    viewmodel.isLoading = false;
                                    onInit();
                                  } else {
                                    viewmodel.isLoading = false;
                                    Get.back();
                                    showDialog(
                                      context: context,
                                      builder: (context) => ErrorAlertPopUp(
                                        errorText: "Failed to update task!",
                                        onPressed: () => Get.to(
                                          () => const HomeView(),
                                          preventDuplicates: false,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                value: viewmodel.todos[index].isCompleted,
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
