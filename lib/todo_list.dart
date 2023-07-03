import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isComplete = false;
  TextEditingController todoTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Todos",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Divider(),
            SizedBox(height: 20),
            ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey[800],
                    ),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(index.toString()),
                    background: Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                    onDismissed: (direction) {
                      print("Removed");
                    },
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          isComplete = !isComplete;
                        });
                      },
                      leading: Container(
                        padding: EdgeInsets.all(2),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle),
                        child: isComplete
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : Container(),
                      ),
                      title: Text('Todo Tile',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600)),
                    ),
                  );
                })
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              backgroundColor: Colors.grey[600],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Row(
                children: [
                  Text("Add Todo", style: TextStyle(fontSize: 20)),
                  Spacer(),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.cancel,
                        color: Theme.of(context).primaryColor,
                      ))
                ],
              ),
              children: [
                Divider(),
                TextFormField(
                  controller: todoTitleController,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: "eg.sxercise", border: InputBorder.none),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        if (todoTitleController.text.isNotEmpty) {
                          print(todoTitleController);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Add")),
                ),
              ],
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
