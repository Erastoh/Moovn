
class UserData {
  late int id;
  late String name;
  late String email;
  late String gender;
  late String status;

  UserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.gender,
      required this.status});

  UserData.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['status'] = this.status;
    return data;
  }
}
