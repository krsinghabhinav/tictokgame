import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addtilst.dart';
import 'todoController.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final todoControl = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoControl.titleController.clear(); // Clear text field for new todo
          Get.to(AddTaskScreen()); // Navigate to AddTaskScreen
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (todoControl.todos.isEmpty) {
          return const Center(
            child: Text(
              'No Todos Available',
              style: TextStyle(fontSize: 18),
            ),
          );
        }

        return ListView.builder(
          itemCount: todoControl.todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todoControl.todos[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Edit Todo Button
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Get.to(AddTaskScreen(
                          index:
                              index)); // Pass index to AddTaskScreen for editing
                    },
                  ),
                  // Delete Todo Button
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      todoControl.deleteTodo(index); // Corrected method name
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
