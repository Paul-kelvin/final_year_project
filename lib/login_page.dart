import 'dart:html';

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
  bool _passwordVisible = false;

  void _navigateToDashboard() {
    // Replace with your actual authentication logic (if needed)
    // For now, assume successful login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CampusPalDashboard()),
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
                        decoration: InputDecoration(
                          labelText: 'University Email *',
                          prefixIcon: Icon(Icons.email),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        obscureText: !_passwordVisible,
                        validator:(value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value!,
                        decoration: InputDecoration(
                          labelText: 'Password *',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
  width: double.infinity,
  child: Theme(
    data: Theme.of(context).copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // Change this to the desired red color
          onPrimary: Colors.white,
          textStyle: TextStyle(fontSize: 18.0),
        ),
      ),
    ),
    child: ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          _navigateToDashboard();
        }
      },
      child: Text('Login'),
    ),
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
