import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/services/firebase_crud.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  bool isComplete = false;
  TextEditingController todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Todos'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: FutureBuilder(
          future: FirebaseCRUD().getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('Id: ${snapshot.data![index].id}'),
                    title: Text('Name: ${snapshot.data![index].name}'),
                    subtitle: Text('age: ${snapshot.data![index].age}'),
                  );
                },
              );
            }
            return const Text('No Data Found');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddUserScreen(),
              ));
        },
      ),
    );
  }
}
