import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/user.dart';
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
            var name = User(
                name: nameCtr.text,
                age: int.parse(ageCtr.text),
                birthday: DateTime.parse(birthdayCtr.text)
            );
            createUser(name: name);
            Get.back();

            // Navigator.pop(context);
            }, child: Text('Create'))


        ],
      ),
    );
  }
}

Future createUser({required User name}) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  final json = name.toJson();
  await docUser.set(json);
}




