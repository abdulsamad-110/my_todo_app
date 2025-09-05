import 'package:flutter/material.dart';
import 'package:my_todo_app/services/auth_service.dart';
import 'package:my_todo_app/ui/home/todo_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon / Logo
              Icon(Icons.lock_outline, size: 90, color: Colors.red.shade700),
              const SizedBox(height: 20),

              // Title
              Text(
                "Secure Login",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle
              Text(
                "Use your fingerprint to access your tasks",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 60),

              // Fingerprint button
              GestureDetector(
                onTap: () async {
                  bool check = await AuthService().authenticateLocally();
                  if (check) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TodoView()),
                    );
                  }
                },
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.shade200,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.fingerprint,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Hint Text
              Text(
                "Touch the fingerprint sensor",
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
