import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/custom_button.dart';
import 'package:todo_app/common/custom_text_field.dart';
import 'package:todo_app/common/error_alert_popup.dart';
import 'package:todo_app/common/success_alert_popup.dart';
import 'package:todo_app/screens/home/home_view.dart';
import 'package:todo_app/screens/home/home_viewmodel.dart';
import 'package:todo_app/screens/search/serach_page_view.dart';
import 'package:todo_app/screens/task_page/task_page_view.dart';

class HomeBody extends StatelessWidget {
  final HomeViewmodel homeViewmodel;
  const HomeBody({Key? key, required this.homeViewmodel}) : super(key: key);

  static const List<Widget> _widgets = <Widget>[
    TaskPageView(),
    SearchPageView(),
  ];

  void _onItemTapped(int index) {
    homeViewmodel.selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: _widgets.elementAt(homeViewmodel.selectedIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          addtask(context, theme);
        },
        backgroundColor: theme.colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: homeViewmodel.selectedIndex,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.secondary,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<dynamic> addtask(BuildContext context, ThemeData theme) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            'Add new task',
            style: theme.textTheme.headline2!.copyWith(fontSize: 22),
          ),
          content: Form(
            key: homeViewmodel.formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'Add Title',
                  controller: homeViewmodel.titleController,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  number: 5,
                  hintText: 'Add Description',
                  controller: homeViewmodel.descriptionController,
                  textInputAction: TextInputAction.done,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CustomButton(
              buttonText: "Cancle",
              buttonColor: theme.colorScheme.background,
              onPressed: () {
                Navigator.of(context).pop();
              },
              textStyle:
                  theme.textTheme.button!.copyWith(color: theme.errorColor),
            ),
            homeViewmodel.isLoading == false
                ? CustomButton(
                    buttonText: "Add",
                    buttonColor: theme.colorScheme.primary,
                    onPressed: () => addTasks(context),
                    textStyle: theme.textTheme.button,
                  )
                : CustomButton(
                    buttonText: "...",
                    buttonColor: theme.colorScheme.primary,
                    onPressed: () {},
                    textStyle: theme.textTheme.button,
                  )
          ],
        );
      },
    );
  }

  addTasks(context) async {
    if (homeViewmodel.formKey.currentState!.validate()) {
      homeViewmodel.isLoading = true;
      var res = await homeViewmodel.addtask();
      if (res.success) {
        homeViewmodel.isLoading = false;
        homeViewmodel.titleController.clear();
        homeViewmodel.descriptionController.clear();
        Get.back();
        showDialog(
          context: context,
          builder: (context) => SuccessAlertPopUp(
            successText: "Successfully added the task!",
            onPressed: () => Get.to(
              () => const HomeView(),
              preventDuplicates: false,
            ),
          ),
        );
      } else {
        homeViewmodel.isLoading = false;
        Get.back();
        showDialog(
          context: context,
          builder: (context) => ErrorAlertPopUp(
            errorText: "Failed to add task!",
            onPressed: () => Get.to(
              () => const HomeView(),
              preventDuplicates: false,
            ),
          ),
        );
      }
    }
  }
}
