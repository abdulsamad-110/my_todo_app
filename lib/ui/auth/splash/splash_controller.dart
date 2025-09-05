import 'package:get/get.dart';
import 'package:my_todo_app/ui/auth/auth_page/auth_view.dart';
import 'package:my_todo_app/ui/home/todo_view.dart';
import 'dart:async';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startSplash();
  }

  void startSplash() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => AuthView());
    });
  }
}
