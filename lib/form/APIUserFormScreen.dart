import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserFormScreen extends StatefulWidget {
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _isSubmitting = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isSubmitting = true;
      });

      // Construct the data to send
      final body = {
        'name': _nameController.text,
        'message': _messageController.text,
      };

      try {
        final response = await http.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 201) {
          // Successful submission
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Message sent successfully!')),
          );
          _nameController.clear();
          _messageController.clear();
        } else {
          // Failure
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send message!')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      } finally {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(labelText: 'Message'),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitForm,
                child: _isSubmitting
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
