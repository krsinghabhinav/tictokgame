import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final List<String> _tasks = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredTasks = [];
  int _searchUsage = 0; // Track search usage for analytics

  @override
  void initState() {
    super.initState();
    _loadTasks();
    _filteredTasks = _tasks;

    _searchController.addListener(() {
      setState(() {
        _filteredTasks = _tasks
            .where((task) => task
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
        _searchUsage++;
      });
    });
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _tasks.addAll(prefs.getStringList('tasks') ?? []);
      _filteredTasks = _tasks;
    });
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', _tasks);
  }

  void _addTask(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _tasks.add(task);
        _filteredTasks = _tasks;
      });
      _saveTasks();
      _controller.clear();
    }
  }

  void _updateTask(int index, String updatedTask) {
    if (updatedTask.isNotEmpty) {
      setState(() {
        _tasks[index] = updatedTask;
        _filteredTasks = _tasks;
      });
      _saveTasks();
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _filteredTasks = _tasks;
    });
    _saveTasks();
  }

  void _showEditDialog(int index) {
    final TextEditingController editController =
        TextEditingController(text: _tasks[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(
              labelText: 'Update your task',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _updateTask(index, editController.text);
                Navigator.pop(context); // Close dialog
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _openAdminPanel() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminPanel(
          totalTasks: _tasks.length,
          searchUsage: _searchUsage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: _openAdminPanel,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          labelText: 'Enter a task',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => _addTask(_controller.text),
                      child: const Text('Add'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search tasks',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_filteredTasks[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showEditDialog(
                              _tasks.indexOf(_filteredTasks[index])),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeTask(
                              _tasks.indexOf(_filteredTasks[index])),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AdminPanel extends StatelessWidget {
  final int totalTasks;
  final int searchUsage;

  const AdminPanel({
    Key? key,
    required this.totalTasks,
    required this.searchUsage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Admin Analytics',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text('Total Tasks: $totalTasks'),
            Text('Search Usage: $searchUsage times'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to To-Do List'),
            ),
          ],
        ),
      ),
    );
  }
}
