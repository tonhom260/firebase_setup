import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final nameCtr = TextEditingController();
  final ageCtr = TextEditingController();
  final birthdayCtr = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameCtr,
            decoration: InputDecoration(
              hintText: 'Name'
            ),
          ),
          SizedBox(height: 24,),
          TextField(
            controller: ageCtr,
            decoration: InputDecoration(
                hintText: 'Age'
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 24,),
          TextField(
            controller: birthdayCtr,
            decoration: InputDecoration(
                hintText: 'Birthday'
            ),
            keyboardType: TextInputType.datetime,

          ),
          SizedBox(height: 24,),
          ElevatedButton(onPressed: (){
            createUser(
              name: nameCtr.text,
              age: int.parse(ageCtr.text),
              bd: DateTime.parse(birthdayCtr.text)
            );
            Navigator.pop(context);}, child: Text('Create'))


        ],
      ),
    );
  }
}

Future createUser({required String name,required int age,required DateTime bd}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  final user = User(
      id:docUser.id,
      name: name,
      age:age,
      birthday:bd
  );
  final json = user.toJson();
  await docUser.set(json);
}


class User {
  String id;
  final String name;
  final int age;
  final DateTime birthday;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.birthday
  });

  Map<String,dynamic> toJson()=>{
    'id':id,
    'name': name,
    'age': age,
    'birthday': birthday
  };

}
