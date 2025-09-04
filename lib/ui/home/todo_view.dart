import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:my_todo_app/ui/home/todo_controller.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController controller = Get.put(TodoController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffcc070b),
        centerTitle: true,
        title: Text('To-Do-List', style: TextStyle(color: Colors.white)),
      ),
      body: GetBuilder<TodoController>(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final todo = controller.todos[index];
              return ListTile(
                title: Text(todo.title),
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    controller.toogleTodoStatus(todo.id);
                  },
                  activeColor: Color(0xffcc070b),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Edit button
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        controller.showEditTodoDialog(todo);
                      },
                    ),
                    // Delete button
                    IconButton(
                      icon: const Icon(Icons.delete, color: Color(0xffcc070b)),
                      onPressed: () {
                        controller.showDeleteTodoDialog(todo.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.showAddTodoDialog();
        },
        backgroundColor: Color(0xffcc070b),
        child: Text("Add", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
