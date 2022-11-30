import 'userfiels_class.dart';

class User {
  String? id;
  String? name;
  String? email;
  User({this.id, this.name, this.email});
  Map<String, dynamic> toJson() => {
        UserFieldClass.id: id,
        UserFieldClass.name: name,
        UserFieldClass.email: email
      };
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
