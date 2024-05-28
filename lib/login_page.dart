import 'package:flutter/material.dart';
import 'dashboard.dart'; // Import for navigation

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _navigateToDashboard() {
    // Replace with your actual authentication logic (if needed)
    // For now, assume successful login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Centered image with increased size
                Center(
                  child: Image.asset(
                    'assets/campuslogo.jpg', // Replace with your image path
                    width: 200.0, // Increased width by 1.5x
                    height: 200.0, // Increased height by 1.5x
                  ),
                ),
                const SizedBox(height: 30.0), // Increased spacing

                // Centered text section
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'CampusPal',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10.0), // Spacing between texts
                    Text(
                      'Join the campus community now',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40.0), // Increased spacing

                // Login form section
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your university email';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value!,
                        decoration: const InputDecoration(
                          labelText: 'University Email *',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        obscureText: true, // Password field
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value!,
                        decoration: const InputDecoration(
                          labelText: 'University Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _navigateToDashboard();
                          }
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(335.0, 48.0),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          primary: Colors.red[800]!, // Adjust color based on #9b3e3e
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
