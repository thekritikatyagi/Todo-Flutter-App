import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/custom_text_field.dart';
import 'package:todo_app/common/list_title_deco.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/search/search_viewmodel.dart';
import 'package:todo_app/screens/stateful_wrapper.dart';
import 'package:todo_app/screens/task_page/task_page_viewmodel.dart';
import 'package:todo_app/screens/task_page/widgets/task_details_page.dart';

class SearchPageBody extends StatelessWidget {
  final SearchViewmodel viewmodel;
  final TaskPageViewmodel tViewmodel;
  const SearchPageBody(
      {Key? key, required this.viewmodel, required this.tViewmodel})
      : super(key: key);

  Future<List<Todo>> getSeachedTasks() async {
    List<Todo> todos = await viewmodel.getSearchedTasks();
    return todos;
  }

  onInit() {
    getSeachedTasks().then((value) {
      viewmodel.todos = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return StatefulWrapper(
      onInit: onInit,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: theme.textTheme.headline2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Looking for something specific?",
                style: theme.textTheme.bodyText2,
              ),
              const SizedBox(height: 50),
              CustomTextFormField(
                onChanged: (val) {
                  if (val.length > 3) {
                    viewmodel.search = val;
                  }
                },
                hintText: "Search",
                iconData2: Icon(
                  Icons.search,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 25),
              viewmodel.search != ''
                  ? viewmodel.todos.isNotEmpty
                      ? Column(
                          children: viewmodel.todos
                              .where((element) => element.title
                                  .toLowerCase()
                                  .contains(
                                      viewmodel.search.toLowerCase().trim()))
                              .map(
                                (e) => ListTileDeco(
                                  child: ListTile(
                                    onTap: () => Get.to(
                                      () => TaskDetailsPage(
                                        todo: e,
                                        viewmodel: tViewmodel,
                                      ),
                                    ),
                                    title: Text(
                                      e.title,
                                      style: theme.textTheme.bodyText1,
                                    ),
                                    trailing: Icon(
                                      Icons.forward,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        )
                  : const Center(
                      child: Text("Search for something"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
