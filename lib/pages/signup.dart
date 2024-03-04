import 'package:flutter/material.dart';
import "package:get_it/get_it.dart";
import 'package:queue_buster_store_partner/service/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final authService = GetIt.I<AuthService>();

  void handleSignup() {
    authService.signup(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      context: context
    );
  }

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                )),
            const SizedBox(
              height: 12,
            ),
            TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                )),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(onPressed: handleSignup, child: const Text('Signup'))
          ],
        ),
      ),
    ));
  }
}
