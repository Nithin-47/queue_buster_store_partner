import 'package:flutter/material.dart';
import "package:get_it/get_it.dart";
import 'package:go_router/go_router.dart';
import 'package:queue_buster_store_partner/service/auth_service.dart';

import '../constants/route_names.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final authService = GetIt.I<AuthService>();

  void handleSignup() {
    authService.signup(
        firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      storeName: _storeNameController.text,
      context: context
    );
  }

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _storeNameController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
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
              controller: _firstNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
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
            TextField(
              controller: _storeNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Store Name'
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(onPressed: handleSignup, child: const Text('Signup')),
            TextButton(onPressed: () {
              context.go(RouteNames.authLogin.path);
            }, child: const Text("Already a member? Login"))
          ],
        ),
      ),
    ));
  }
}
