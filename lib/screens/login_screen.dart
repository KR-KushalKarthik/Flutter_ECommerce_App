import 'package:flutter/material.dart';
import 'package:project2/screens/home_screen.dart';
import 'package:project2/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isError = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.amber, // Keep app bar color
      ),
      body: Container(
        // Add a container for the background color
        decoration: BoxDecoration(
          color: Colors.white, // Set background color
        ),
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/app3.png', width: 150, height: 150),
              SizedBox(height: 20),
              Container(
                // Wrap username field in a container
                decoration: BoxDecoration(
                  color: Colors.white, // Set background color for the field
                  borderRadius:
                      BorderRadius.circular(10.0), // Add rounded corners
                ),
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                // Wrap password field in a container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login, // Call the _login function directly
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Add your forgot password logic here
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 12), // Set font size to 12
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Or login with:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Add your social login with Google logic here
                    },
                    icon: Image.asset('assets/google.png',
                        width: 30, height: 30), // Set width and height to 30
                  ),
                  IconButton(
                    onPressed: () {
                      // Add your social login with Facebook logic here
                    },
                    icon: Image.asset('assets/facebook.png',
                        width: 30, height: 30), // Set width and height to 30
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Add your create account logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              if (_isError)
                Text(
                  'Incorrect username or password',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Define the _login function
  void _login() {
    // Navigate to the home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
