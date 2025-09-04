import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_app/models/todo_model.dart';

class TodoController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController editController = TextEditingController();
  final RxList<TodoModel> todos = <TodoModel>[].obs;

  /// Add new todo
  void addTodo(String title) {
    final newTodo = TodoModel(
      id: DateTime.now().toString(),
      title: title,
      isCompleted: false,
    );
    todos.add(newTodo);
    update();
  }

  /// Delete todo
  void deleteTodo(String id) {
    todos.removeWhere((todo) => todo.id == id);
    update();
  }

  /// Toggle status
  void toogleTodoStatus(String id) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    todo.isCompleted = !todo.isCompleted;
    update();
  }

  /// Show add dialog
  // void showAddTodoDialog() {
  //   Get.defaultDialog(
  //     title: "Add New To-do",
  //     content: TextFormField(
  //       controller: titleController,
  //       decoration: const InputDecoration(labelText: 'To-Do Title'),
  //     ),
  //     textCancel: 'Cancel',
  //     textConfirm: 'Add',
  //     onConfirm: () {
  //       final inputText = titleController.text.trim();

  //       if (inputText.isEmpty) {
  //         Get.snackbar(
  //           "Error",
  //           "To-do title cannot be empty",
  //           backgroundColor: Colors.blueGrey,
  //           colorText: Colors.white,
  //         );
  //       } else {
  //         addTodo(inputText);
  //         Get.back();
  //         Get.snackbar(
  //           "Success",
  //           "To-do added successfully",
  //           backgroundColor: Colors.blueGrey,
  //           colorText: Colors.white,
  //         );
  //       }
  //     },
  //   );
  // }
  void showAddTodoDialog() {
    final TextEditingController titleController = TextEditingController();

    Get.defaultDialog(
      title: "Add New To-do",
      content: TextFormField(
        controller: titleController,
        decoration: const InputDecoration(labelText: 'To-Do Title'),
      ),
      actions: [
        // Cancel button with red border
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(color: Color(0xffcc070b)),
          ),
          onPressed: () => Get.back(),
          child: const Text("Cancel"),
        ),

        // Add button with red background
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffcc070b),
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            final inputText = titleController.text.trim();

            if (inputText.isEmpty) {
              Get.snackbar(
                "Error",
                "To-do title cannot be empty",
                backgroundColor: Colors.blueGrey,
                colorText: Colors.white,
              );
            } else {
              addTodo(inputText);
              Get.back();
              Get.snackbar(
                "Success",
                "To-do added successfully",
                backgroundColor: Colors.blueGrey,
                colorText: Colors.white,
              );
            }
          },
          child: const Text("Add"),
        ),
      ],
    );
  }

  /////

  void showEditTodoDialog(TodoModel todo) {
    final TextEditingController editController = TextEditingController(
      text: todo.title,
    );

    Get.defaultDialog(
      title: "Edit To-do",
      content: TextFormField(
        controller: editController,
        decoration: const InputDecoration(labelText: 'Update Title'),
      ),
      actions: [
        // Cancel Button
        OutlinedButton(
          onPressed: () => Get.back(),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(color: Color(0xffcc070b)),
          ),
          child: const Text("Cancel"),
        ),

        // Update Button
        ElevatedButton(
          onPressed: () {
            final updatedText = editController.text.trim();

            if (updatedText.isEmpty) {
              Get.snackbar(
                "Error",
                "Title cannot be empty",
                backgroundColor: Color(0xffcc070b),
                colorText: Colors.white,
              );
            } else {
              todo.title = updatedText;
              update();
              Get.back();
              Get.snackbar(
                "Updated",
                "To-do updated successfully",
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffcc070b),
            foregroundColor: Colors.white,
          ),
          child: const Text("Update"),
        ),
      ],
    );
  }

  /// ✅ Show delete dialog
  // void showDeleteTodoDialog(String todoId) {
  //   Get.defaultDialog(
  //     title: "Delete To-do",
  //     content: const Text("Are you sure you want to delete this to-do?"),
  //     textCancel: 'Cancel',
  //     textConfirm: 'Delete',
  //     confirmTextColor: Colors.white,
  //     onConfirm: () {
  //       deleteTodo(todoId);
  //       Get.back(); // Close dialog
  //       Get.snackbar(
  //         "Deleted",
  //         "To-do deleted successfully",
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     },
  //   );
  // }
  void showDeleteTodoDialog(String todoId) {
    Get.defaultDialog(
      title: "Delete To-do",
      content: const Text("Are you sure you want to delete this to-do?"),
      actions: [
        ///// Cancel button
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(color: Color(0xffcc070b)),
          ),
          onPressed: () => Get.back(),
          child: const Text("Cancel", style: TextStyle(color: Colors.black)),
        ),

        ///// Delete button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffcc070b),
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            deleteTodo(todoId);
            Get.back();
            Get.snackbar(
              "Deleted",
              "To-do deleted successfully",
              backgroundColor: Colors.blueGrey,
              colorText: Colors.white,
            );
          },
          child: const Text("Delete"),
        ),
      ],
    );
  }
}
