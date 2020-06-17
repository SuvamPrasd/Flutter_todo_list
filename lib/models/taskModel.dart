class TaskModel {
  String date;
  String detail;

  String get getTitle => date;
  String get getDetail => detail;

  TaskModel(this.date, this.detail);
}
