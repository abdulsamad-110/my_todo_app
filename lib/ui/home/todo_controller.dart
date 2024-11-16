
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  TextEditingController taskController = TextEditingController();
  var tasks = <String>[].obs;


  void addTask(String task) {
    if (task.isNotEmpty) {
      tasks.add(task);
    }
  }


  void removeTask(int index) {

  }

  void editTask(int index, String newTask) {
    if (newTask.isNotEmpty) {
      tasks[index] = newTask;
    }
  }
}

