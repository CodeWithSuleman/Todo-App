import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/todo_list.dart';
import 'package:todo_app/services/firebase_crud.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'ID'),
            controller: idController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Name'),
            controller: nameController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Age'),
            controller: ageController,
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseCRUD().createUser(
                User(
                  id: idController.text,
                  name: nameController.text,
                  age: int.tryParse(ageController.text) ?? 0,
                ),
              );
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoListScreen(),
                  ));
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
