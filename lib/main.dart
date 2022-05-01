import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setup/user_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterFireStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
        ),
        actions: [
          IconButton(
              onPressed: () {
                final name = controller.text;
                createUser(name: name);
                controller.clear();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user = User(
      id:docUser.id,
      name: name,
      age:21,
      birthday:DateTime(2001,7,28)
    );
    final json = user.toJson();
    await docUser.set(json);
  }
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
