import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? iconData;
  final Widget? iconData2;
  final Widget? sufixText;
  final Function()? onPressed;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final bool? isEnabled;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? number;
  final Iterable<String>? autofillHints;
  final String? lable;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.controller,
    this.validator,
    this.iconData,
    this.sufixText,
    this.iconData2,
    this.onPressed,
    this.onChanged,
    this.isEnabled,
    this.textInputType,
    this.number = 1,
    this.textInputAction,
    this.autofillHints,
    this.onEditingComplete,
    this.lable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      autofillHints: autofillHints,
      maxLines: number,
      minLines: number,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      enabled: isEnabled,
      onChanged: onChanged,
      obscureText: false,
      controller: controller,
      validator: validator,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.background.withOpacity(0.6),
        prefixIcon: iconData,
        suffixIcon: iconData2,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        errorStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.error.withOpacity(0.6),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.6),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
          ),
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Theme.of(context).hintColor,
            ),
        suffix: sufixText,
        labelText: lable ?? hintText,
        labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Theme.of(context).hintColor,
            ),
      ),
    );
  }
}
