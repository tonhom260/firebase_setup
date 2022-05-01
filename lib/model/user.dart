import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  late String id;
   late String name;
   late int age;
   late DateTime birthday;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.birthday
  });

  // factory User.fromJson(Map <String,dynamic> json){
  //   return User(
  //     id: json['id'],
  //     name: json['name'],
  //     age: json['age'],
  //     birthday: json['birthday']
  //   );
  User.fromJson(Map <String,dynamic> json){
    id = json['id'];
    name = json['name'];
    age = json['age'];
    birthday = (json['birthday'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday
      };
}