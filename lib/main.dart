import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/todoModel.dart';
import 'package:todo_list/widgets/form_screen.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (context) => TodoModel(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      // home: ChangeNotifierProvider(
      //     create: (context) => TodoModel(), child: TodoList()),
      home: TodoList(),
      routes: {'/formScreen': (context) => FormScreen()},
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Consumer<TodoModel>(
        builder: (context, todo, child) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        todo.taskList[index].date,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        todo.taskList[index].detail,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: todo.taskList.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Provider.of<TodoModel>(context, listen: false).addTaskModel();
          Navigator.pushNamed(context, '/formScreen');
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
