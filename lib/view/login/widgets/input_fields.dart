import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class InputFields extends StatelessWidget {
  const InputFields({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      decoration:
          InputDecoration(hintText: hintText, border: OutlineInputBorder()),
    );
  }
}
