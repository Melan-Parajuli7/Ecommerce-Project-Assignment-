import 'dart:math';

import 'package:flutter/material.dart';

import "../shop.dart";

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


@override
Widget build(BuildContext context) {
  return const Placeholder();
}
