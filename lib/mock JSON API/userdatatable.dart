import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mockController.dart';

class UserDataTable extends StatelessWidget {
  const UserDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController =
        Get.put(UserController()); // Initialize controller

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data Table'),
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (userController.users.isEmpty) {
          return const Center(child: Text('No users found.'));
        } else {
          return SingleChildScrollView(
            child: PaginatedDataTable(
              header: const Text('User Data'),
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Email')),
              ],
              source: UserDataSource(
                users: userController.users,
                onRowSelected: (isSelected, user) {
                  userController.toggleUserSelection(user, isSelected!);
                },
              ),
              rowsPerPage: PaginatedDataTable.defaultRowsPerPage,
              actions: [
                TextButton(
                  onPressed: () {
                    print(
                        'Selected Users: ${userController.selectedUsers.map((e) => e.name).toList()}');
                  },
                  child: const Text('Print Selected'),
                ),
              ],
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => userController.fetchUsers(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class UserDataSource extends DataTableSource {
  final List<User> users;
  final Function(bool?, User) onRowSelected;

  UserDataSource({
    required this.users,
    required this.onRowSelected,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= users.length) return null;
    final user = users[index];
    return DataRow(
      selected: false,
      onSelectChanged: (isSelected) {
        onRowSelected(isSelected, user);
      },
      cells: [
        DataCell(Text(user.id.toString())),
        DataCell(Text(user.name)),
        DataCell(Text(user.email)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
