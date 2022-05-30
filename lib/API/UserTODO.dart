
class UserTodo {
  late int id;
  late int user_id;
  late String title;
  late String due_on;
  late String status;

  UserTodo(
      {required this.id,
      required this.user_id,
      required this.title,
      required this.due_on,
      required this.status});

  UserTodo.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    title = json['title'];
    due_on = json['due_on'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.user_id;
    data['title'] = this.title;
    data['due_on'] = this.due_on;
    data['status'] = this.status;
    return data;
  }
}
