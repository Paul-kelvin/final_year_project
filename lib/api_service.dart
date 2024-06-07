import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode, jsonEncode;

class ApiService {
  Future<Map<String, dynamic>> fetchApi() async {
    final response = await http.get(Uri.parse('https://campuspal-backend.onrender.com/docs'));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load API');
    }
  }

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://campuspal-backend.onrender.com/users/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Login successful, navigate to dashboard');
       _navigateToDashboard();
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> signup(String email, String password, String name, String phoneNumber, String college, String department, String programme) async {
    final response = await http.post(
      Uri.parse('https://campuspal-backend.onrender.com/users/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
        'name': name,
        'phoneNumber': phoneNumber,
        'college': college,
        'department': department,
        'program': programme,
      }),
    );

    if (response.statusCode == 200) {
      print('Signup successful, navigate to dashboard');
       _navigateToDashboard();
    } else {
      throw Exception('Failed to signup');
    }
  }
}

class _navigateToDashboard {
}
