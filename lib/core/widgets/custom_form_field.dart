import 'package:flutter/material.dart';

Widget defaultFormField({
  required context,
  TextEditingController? controller,
  dynamic label,
  IconData? prefix,
  String? initialValue,
  TextInputType? keyboardType,
  onSubmit,
  onChange,
  onTap,
  required validate,
  bool isPassword = false,
  bool enabled = true,
  IconData? suffix,
  suffixPressed,
}) => TextFormField(
  controller: controller,
  keyboardType: keyboardType,
  obscureText: isPassword,
  textAlign: TextAlign.start,
  onFieldSubmitted: onSubmit,
  enabled: enabled,
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  textCapitalization: TextCapitalization.words,
  textAlignVertical: TextAlignVertical.center,
  style: Theme.of(context).textTheme.bodyLarge,
  initialValue: initialValue,

  //textCapitalization: TextCapitalization.words,
  decoration: InputDecoration(
    hintText: label,
    border: UnderlineInputBorder(),
    prefixIcon: Icon(prefix),
    suffixIcon:
        suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
  ),
);
