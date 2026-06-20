import 'package:flutter/material.dart';
import '../../categories/screens/categories_screen.dart';
import '../models/login_request.dart';
import '../services/auth_service.dart';
import '../../home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
      final _authService = AuthService();

  final _emailController =
      TextEditingController();

  final _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller:
                  _emailController,
              decoration:
                  const InputDecoration(
                labelText: "Email",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller:
                  _passwordController,
              obscureText: true,
              decoration:
                  const InputDecoration(
                labelText: "Password",
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () async {
                  try {
                    final response =
                        await _authService.login(
                      LoginRequest(
                        email:
                            _emailController.text,
                        password:
                            _passwordController.text,
                      ),
                    );

                    if (!mounted) return;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const CategoriesScreen(),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        content:
                            Text(e.toString()),
                      ),
                    );
                  }
                },
              child:
                  const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}