import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class UserController extends GetxController {
  var users = <User>[].obs; // Reactive list of users
  var selectedUsers = <User>[].obs; // Reactive list of selected users
  var isLoading = false.obs;

  // Fetch users from API
  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        users.value = data.map((userJson) => User.fromJson(userJson)).toList();
      } else {
        Get.snackbar("Error", "Failed to load users");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Toggle user selection
  void toggleUserSelection(User user, bool isSelected) {
    if (isSelected) {
      selectedUsers.add(user);
    } else {
      selectedUsers.remove(user);
    }
  }
}
