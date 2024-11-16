import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/home/todo_controller.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.editController,
    required this.controller,
    required this.index,
  });

  final TextEditingController editController;
  final TodoController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xff0ba360), width: 3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Edit Task',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: editController,
              decoration: const InputDecoration(
                labelText: 'Update your task',
                labelStyle: TextStyle(color: Color(0xff0ba360)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff0ba360),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff0ba360),
                    width: 2.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog without saving
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0ba360),
                  ),
                  child: const Text('Cancel', style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.editTask(index, editController.text); // Save the edited task
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0ba360),
                  ),
                  child: const Text('Save', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
