import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async{
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
      home:  MainPage(),
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
          IconButton(onPressed: (){
            final name = controller.text;
            createUser(name:name);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
 Future createUser ({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
    final json = {
      'name':name,
      'age':21,
      'birthday':DateTime(2001,7,28),
    };
    await docUser.set(json);
}

}
