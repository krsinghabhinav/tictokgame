import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictokgame/form/customerformtext.dart';
import 'package:tictokgame/form/formcontroller.dart';

class Formtestpratices extends StatefulWidget {
  const Formtestpratices({super.key});

  @override
  State<Formtestpratices> createState() => _FormtestpraticesState();
}

class _FormtestpraticesState extends State<Formtestpratices> {
  final _formKey = GlobalKey<FormState>();

  final formController = Get.put(Formcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Test'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomFormText(
              label: 'Name',
              hintText: 'Name',
              controller: formController.nameController,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomFormText(
              label: "Email",
              hintText: "email",
              controller: formController.emailController,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomFormText(
              label: "PhoenNumber",
              hintText: "PhoneNumber",
              controller: formController.phoneController,
              validation: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = formController.nameController.text;
                    final email = formController.emailController.text;
                    final phone = formController.phoneController.text;

                    print("name:$name + \n email:$email + \n phone:$phone");
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("form Submited"),
                        content: Text(
                            "name:$name + \n email:$email + \n phone:$phone"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('OK'),
                          )
                        ],
                      ),
                    );
                  }
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
