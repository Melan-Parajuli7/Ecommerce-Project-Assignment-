import 'package:flutter/material.dart';
import './auth/auth_service.dart';
import 'screens/login_screen.dart';
import 'shop.dart';


// set reference class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final username = await AuthService().currentUser();
  runApp(LoginApp(isLoggedIn : username!= null));
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key,
    required this.isLoggedIn
  });
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home : isLoggedIn ? const Shop() : const loginScreen(),
    );
  }

}





