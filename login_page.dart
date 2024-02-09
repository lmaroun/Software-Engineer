import 'package:flutter/material.dart';
import 'home_page.dart';
import 'SignUpPage.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Check if username and password are correct
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username == "admin" && password == "password") {
      // Navigate to home page if login is successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()),
      );
    } else {
      // Show an error message if login is unsuccessful
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Error"),
          content: Text("Invalid username or password."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
            
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Username",
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _login,
              child: Text("Login"),
            ),
            TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  },
  child: Text('Create an account'),
),

          ],
        ),
      ),
    );
  }
}
