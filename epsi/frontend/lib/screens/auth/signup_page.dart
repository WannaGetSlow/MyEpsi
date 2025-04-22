import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Initialize controllers properly
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Add build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : _signUp,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        final response = await http.post(
          Uri.parse('http://localhost:8000/api/auth/register/'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'email': _emailController.text,
            'password': _passwordController.text,
            // Add other required fields from your Django User model
            'first_name': 'John',  // Example field
            'last_name': 'Doe'     // Example field
          }),
        );

        if (response.statusCode == 201) {
          if (mounted) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Registration failed: ${response.body}')),
            )
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Connection error')),
          );
        }
      }
      setState(() => _isLoading = false);
    }
  }
}