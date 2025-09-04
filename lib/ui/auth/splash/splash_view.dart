import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller initialize
    final controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: Color(0xffcc070b),
      body: const Center(
        child: Icon(
          Icons.task_alt,
          size: 100, // Icon size
          color: Colors.white, // Icon color
        ),
      ),
    );
  }
}
