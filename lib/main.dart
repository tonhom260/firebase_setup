import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setup/user_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterFireStore',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Get.to(() => UserPage())},
        child: Icon(Icons.create),
      ),
      appBar: AppBar(title: Text('All Users')),
      // This trailing comma makes auto-formatting nicer for build methods.
      body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Widget buildUser(User user) => ListTile(
      title: Text(user.name),
      leading: CircleAvatar(
        child: Text('${user.age}'),
      ),
      subtitle: Text(user.birthday.toIso8601String()),
    );

Stream<List<User>> readUsers ()
{return FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
    snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());}
