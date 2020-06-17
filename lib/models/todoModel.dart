import 'package:flutter/cupertino.dart';
import 'package:todo_list/models/taskModel.dart';

class TodoModel with ChangeNotifier {
  List<TaskModel> taskList = [];

  void addTaskModel(String date, String detail) {
    TaskModel taskModel = new TaskModel(date, detail);
    taskList.add(taskModel);
    notifyListeners();
  }
}
