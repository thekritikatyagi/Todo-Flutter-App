import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:todo_app/common/custom_button.dart';

class ErrorAlertPopUp extends StatelessWidget {
  final String errorText;
  final String? type;
  final Function() onPressed;
  const ErrorAlertPopUp(
      {Key? key, required this.errorText, this.type, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsPadding: const EdgeInsets.only(left: 15, right: 15),
      scrollable: true,
      title: Column(
        children: [
          const SizedBox(
            height: 120,
            width: 120,
            child: RiveAnimation.asset(
              "assets/animations/error_icon.riv",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            errorText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      actions: [
        CustomButton(
          buttonText: "Okay!",
          buttonColor: Theme.of(context).colorScheme.primary,
          onPressed: onPressed,
          textStyle: Theme.of(context).textTheme.button,
        ),
      ],
    );
  }
}
