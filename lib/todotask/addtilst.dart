import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'todoController.dart';

class AddTaskScreen extends StatelessWidget {
  final TodoController todoControl =
      Get.put(TodoController()); // Corrected class name
  final int? index; // Add index for update scenario

  AddTaskScreen({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    // If an index is passed, set the controller text to the existing todo
    if (index != null) {
      todoControl.titleController.text = todoControl.todos[index!];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(todoControl.titleController.text.isEmpty
            ? 'Add Task'
            : 'Update Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: todoControl.titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              return ElevatedButton(
                onPressed: todoControl.isLoading.value
                    ? null
                    : () {
                        if (todoControl.titleController.text.isNotEmpty) {
                          if (index == null) {
                            todoControl.addTodo();
                          } else {
                            todoControl.updateTodo(index!);
                          }
                        }
                      },
                child: todoControl.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(index == null ? 'Add Todo' : 'Update Todo'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
