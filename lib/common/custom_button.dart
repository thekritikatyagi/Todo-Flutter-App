import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final EdgeInsetsGeometry padding;
  final Function() onPressed;
  final dynamic textStyle;
  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.buttonColor,
      this.padding = const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 10,
        bottom: 10,
      ),
      required this.onPressed,
      required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: padding,
          primary: buttonColor,
          elevation: 0,
        ),
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}
