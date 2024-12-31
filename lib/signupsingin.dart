import 'package:flutter/material.dart';

class SignInSignUpPage extends StatefulWidget {
  @override
  _SignInSignUpPageState createState() => _SignInSignUpPageState();
}

class _SignInSignUpPageState extends State<SignInSignUpPage> {
  bool isSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isSignIn ? 'Welcome Back!' : 'Join Us!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                isSignIn
                    ? 'Please sign in to continue'
                    : 'Create an account to get started',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: isSignIn ? _buildSignInForm() : _buildSignUpForm(),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    isSignIn = !isSignIn;
                  });
                },
                child: Text(
                  isSignIn
                      ? "Don't have an account? Sign Up"
                      : "Already have an account? Sign In",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return Container(
      key: ValueKey('SignInForm'),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle sign-in logic here
            },
            child: Text('Sign In'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Container(
      key: ValueKey('SignUpForm'),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle sign-up logic here
            },
            child: Text('Sign Up'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}
