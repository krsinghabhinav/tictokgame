import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationFormController extends GetxController {
  // Controllers for form fields
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // List of dynamic additional fields
  var additionalTextControllers = <TextEditingController>[].obs;

  // Add new text field
  void addTextField() {
    additionalTextControllers.add(TextEditingController());
  }

  // Submit form using Get.dialog for GetX dialog management
  void submitForm() {
    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        emailController.text.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text) ||
        passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Please fill all fields correctly.');
    } else {
      String username = usernameController.text;
      String password = passwordController.text;
      String email = emailController.text;

      List<String> additionalInputs = [];
      for (var controller in additionalTextControllers) {
        additionalInputs.add(controller.text);
      }

      // Show data in a dialog box using GetX's Get.dialog
      Get.dialog(
        AlertDialog(
          title: Text('Form Submitted'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Username: $username'),
              Text('Password: $password'),
              Text('Email: $email'),
              // Manually iterate through additionalInputs to display them
              for (var input in additionalInputs)
                Text('Additional Input: $input'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
