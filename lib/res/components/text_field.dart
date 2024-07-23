import 'package:flutter/material.dart';

class TextField extends StatefulWidget {
  const TextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: widget.hintText, border: OutlineInputBorder()),
    );
  }
}
