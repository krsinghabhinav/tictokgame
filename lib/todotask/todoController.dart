import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  // Observable list to hold todos
  var todos = <String>[].obs;

  // Observable for loading state
  var isLoading = false.obs;

  // Controller for text input
  final titleController = TextEditingController();

  // Method to add a todo
  void addTodo() {
    final todo = titleController.text.trim();

    if (todo.isEmpty) return; // Ensure we don't add empty todos

    isLoading.value = true; // Set loading to true

    Future.delayed(Duration(milliseconds: 300), () {
      todos.add(todo); // Add the todo to the list
      titleController.clear(); // Clear the input field
      isLoading.value = false; // Set loading to false
    });
  }

  // Method to delete a todo
  void deleteTodo(int index) {
    todos.removeAt(
        index); // Remove the todo from the list at the specified index
  }

  // Method to update a todo
  void updateTodo(int index) {
    final updatedTodo = titleController.text.trim();

    if (updatedTodo.isEmpty) return; // Avoid updating with empty text

    todos[index] = updatedTodo; // Update the todo at the specified index
    titleController.clear(); // Clear the input field after updating
  }

  @override
  void onClose() {
    titleController
        .dispose(); // Dispose the controller when the controller is closed
    super.onClose();
  }
}
