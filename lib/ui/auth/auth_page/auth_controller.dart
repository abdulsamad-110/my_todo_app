import 'package:get/get.dart';
import 'package:my_todo_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/home/todo_view.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  /// Loader status
  var isLoading = false.obs;

  /// Fingerprint authentication
  Future<void> authenticate() async {
    try {
      isLoading.value = true;
      bool check = await _authService.authenticateLocally();
      isLoading.value = false;

      if (check) {
        Get.off(() => const TodoView()); // Navigator ki jagah GetX use
      } else {
        Get.snackbar(
          "Authentication Failed",
          "Fingerprint not recognized",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          //snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        //snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
