import 'package:flutter/material.dart';
import 'screens/auth/login_page.dart';
import 'screens/auth/forgot_password_page.dart';
import 'screens/auth/reset_password_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EPSI App',
      theme: ThemeData(
        primaryColor: const Color(0xFF4A2A82),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4A2A82)),
        useMaterial3: true,
      ),
      home: const HomePage(), // Set HomePage as initial route
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case '/forgot-password':
            return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
          case '/reset-password':
            final token = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (_) => ResetPasswordPage(token: token ?? ''),
            );
          default:
            return MaterialPageRoute(builder: (_) => const HomePage());
        }
      },
    );
  }
}
