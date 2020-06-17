import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/todoModel.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _textController = TextEditingController();
  String _newDate;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _selectedDate(BuildContext context) async {
      final DateTime d = await showDatePicker(
          builder: (context, child) {
            return Theme(
              data: ThemeData.dark(),
              child: child,
            );
          },
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020, 6, 14),
          lastDate: DateTime(2025, 1, 1));

      if (d != null) {
        setState(() {
          _newDate = new DateFormat.yMMMMd("en_US").format(d);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter the description',
              ),
            ),
            SizedBox(height: 10),
            FlatButton(
                onPressed: () {
                  _selectedDate(context);
                },
                child: Text('Date Picker')),
            SizedBox(height: 10),
            RaisedButton.icon(
                onPressed: () {
                  if (_textController.value.text.length > 0) {
                    print(_textController.value.text);
                    print(_newDate);
                    Provider.of<TodoModel>(context, listen: false)
                        .addTaskModel(_newDate, _textController.value.text);
                    Navigator.pop(context);
                  }
                  return;
                },
                icon: Icon(Icons.add),
                label: Text('Add'))
          ],
        ),
      ),
    );
  }
}
