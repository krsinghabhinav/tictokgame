import 'package:flutter/material.dart';

class Step1 extends StatefulWidget {
  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step 1: Name')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/step2',
                  arguments: {'name': _nameController.text},
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class Step2 extends StatefulWidget {
  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: Text('Step 2: Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Enter your email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/step3',
                  arguments: {
                    'name': args['name'],
                    'email': _emailController.text,
                  },
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class Step3 extends StatefulWidget {
  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: Text('Step 3: Phone')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Enter your phone number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/summary',
                  arguments: {
                    'name': args['name'],
                    'email': args['email'],
                    'phone': _phoneController.text,
                  },
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: Text('Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${args['name']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: ${args['email']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Phone: ${args['phone']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/step1'));
              },
              child: Text('Start Over'),
            ),
          ],
        ),
      ),
    );
  }
}
