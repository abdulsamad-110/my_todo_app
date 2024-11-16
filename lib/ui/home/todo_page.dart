import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_app/ui/home/todo_controller.dart';
import 'widgets/customdialog.dart';
import 'widgets/customtexfeild.dart';

class TodoPage extends StatelessWidget {
  TodoController controller = Get.put(TodoController());

  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0ba360),
        centerTitle: true,
        title: const Text(
          'T o D o ~ A p p',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(controller: controller.taskController),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.tasks[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              showEditDialog(context, index);
                            },
                          ),
                          IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                controller.removeTask(index);
                              }),
                        ],
                      ),
                    );
                  },
                );
              }),
            ) // Task List using Obx
          ],
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            controller.addTask(controller.taskController.text);
            controller.taskController.clear();
          },
          backgroundColor: const Color(0xff0ba360),
          label: const Text('Add', style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  void showEditDialog(BuildContext context, int index) {
    TextEditingController editController = TextEditingController(
      text: controller.tasks[index],
    );

    showGeneralDialog(
      context: context,
      barrierLabel: "Edit Task",
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return CustomDialog(
          editController: editController,
          controller: controller,
          index: index,
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.scale(
          scale: anim1.value,
          child: child,
        );
      },
    );
  }

}
