class ToDoList {
  int? id;
  String? title;
  bool? completed;
  String? priority;

  ToDoList({this.id, this.title, this.completed, this.priority});

  ToDoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    data['priority'] = this.priority;
    return data;
  }
}
