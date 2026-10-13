import 'dart:math';

import 'package:flutter/material.dart';

import "../shop.dart";
import "./register_screen.dart";

import '../auth/auth_service.dart'; // this import helps to use the functions and methods of the auth_service.dart file

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _LoginScreenState(); // it is a state ful widget so i have to create __LoginScreenState
}

class _LoginScreenState extends State<loginScreen> {
  final _formKey =
      GlobalKey<
        FormState
      >(); // A handle on the form which helps to validation on fields
  final _usernameController = TextEditingController();
  final _passordController = TextEditingController();
  final _auth =
      AuthService(); // An authService object to call login() in the future
  bool _obscure =
      true; // shows the password as dots while typing in the password text
  bool _loading = false; // true = login in process, shows spinner

  @override
  void dispose() {
    _usernameController.dispose();
    _passordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    // main logic of this class
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final error = await _auth.login(
      username: _usernameController.text.trim(),
      password: _passordController.text,
    );
    if (!mounted) return;
    setState(() => _loading = false);
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.red),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Shop()),
    );
  }

  // the body part of the Login Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 72,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  // the main purpose of this SizeBox is to give me wanted Space
                  Text(
                    'Login to Continue',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Enter Username'
                        : null, // if the text field is empty act like a place holder and show Enter Username
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passordController,
                    obscureText: _obscure,
                    // helps to hide the password using the (.) at the time of typing
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () => setState(() => _obscure = !_obscure),
                      ),
                    ),
                    validator: (v) =>
                        (v == null || v.isEmpty) ? 'Enter Password' : null,
                  ),
                  SizedBox(height: 24),
                  FilledButton(
                    onPressed: _loading ? null : _login,
                    child: _loading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Login'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dont Have an account"),
                      TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=> const RegisterScreen()),
                          ),
                          child: const Text('Register')
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
