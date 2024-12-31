import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileFileScr extends StatefulWidget {
  const ProfileFileScr({super.key});

  @override
  State<ProfileFileScr> createState() => _ProfileFileScrState();
}

class _ProfileFileScrState extends State<ProfileFileScr> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? profileImagePath;

  @override
  void initState() {
    super.initState();
    loadingSharepref();
  }

  void loadingSharepref() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = pref.getString('name') ?? "";
      emailController.text = pref.getString('email') ?? "";
      profileImagePath = pref.getString('profileImagePath');
    });
  }

  void saveProfileShareprefe() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('name', nameController.text);
    await pref.setString('email', emailController.text);
    if (profileImagePath != null) {
      await pref.setString('profileImagePath', profileImagePath!);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
    loadingSharepref(); // Refresh the displayed data
  }

  final image = ImagePicker();
  Future<void> imagepick() async {
    final imagepacker = await image.pickImage(source: ImageSource.gallery);
    if (imagepacker != null) {
      setState(() {
        profileImagePath = imagepacker.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                imagepick();
              },
              child: CircleAvatar(
                radius: 100,
                backgroundImage: profileImagePath != null
                    ? FileImage(File(profileImagePath!))
                    : null,
                child: profileImagePath != null
                    ? null
                    : const Icon(Icons.person, size: 100),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                saveProfileShareprefe();
              },
              child: const Text("Save"),
            ),
            const SizedBox(height: 24),
            // Display saved details
            if (nameController.text.isNotEmpty ||
                emailController.text.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Saved Profile Details:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (profileImagePath != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(File(profileImagePath!)),
                    ),
                  const SizedBox(height: 8),
                  Text("Name: ${nameController.text}"),
                  Text("Email: ${emailController.text}"),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
