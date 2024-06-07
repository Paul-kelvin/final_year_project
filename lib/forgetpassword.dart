import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  bool _emailSent = false;

  Future<void> _sendEmail(String email) async {
    try {
     // await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      setState(() {
        _emailSent = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _emailSent
                  ? Text(
                      'An email has been sent to your university email address with instructions to reset your password.',
                      style: TextStyle(fontSize: 16.0, color: Colors.green),
                    )
                  : Form(
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
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                await _sendEmail(_email);
                              }
                            },
                            child: Text('Send Email'),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

