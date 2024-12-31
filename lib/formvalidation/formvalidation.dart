import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fromcontroller.dart';

class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RegistrationFormController controller =
        Get.put(RegistrationFormController());

    return Scaffold(
      appBar: AppBar(title: Text('User Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Obx(() {
            return ListView(
              children: [
                // Username field
                TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                // Password field
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                // Confirm Password field
                TextFormField(
                  controller: controller.confirmPasswordController,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != controller.passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                // Email field
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                // Dynamic additional text fields - Without using the spread operator
                for (var i = 0;
                    i < controller.additionalTextControllers.length;
                    i++)
                  TextFormField(
                    controller: controller.additionalTextControllers[i],
                    decoration:
                        InputDecoration(labelText: 'Additional Input ${i + 1}'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field cannot be empty';
                      }
                      return null;
                    },
                  ),
                SizedBox(
                  height: 20,
                ),
                // Add Text Field Button
                ElevatedButton(
                  onPressed: controller.addTextField,
                  child: Text('Add More Fields'),
                ),

                SizedBox(
                  height: 20,
                ),
                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    controller.submitForm();
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
