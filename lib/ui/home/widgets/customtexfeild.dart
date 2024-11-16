// customtexfeild.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Enter your task',
        labelStyle: const TextStyle(color: Color(0xff0ba360)),
        prefixIcon: const Icon(Icons.task, color: Color(0xff0ba360)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff0ba360),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff0ba360),
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
