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
        onPressed: () {   },
        child: Icon(Icons.create),
      ),
      appBar: AppBar(
        title: Text('All Users')
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


}

// class User {
//   String id;
//   final String name;
//   final int age;
//   final DateTime birthday;
//
//   User({
//     this.id = '',
//     required this.name,
//     required this.age,
//     required this.birthday
//   });
//
//   Map<String,dynamic> toJson()=>{
//     'id':id,
//     'name': name,
//     'age': age,
//     'birthday': birthday
//   };
//
// }
