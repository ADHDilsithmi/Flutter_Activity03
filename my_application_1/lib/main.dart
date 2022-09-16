import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class  _MyAppState extends State<MyApp> {
  TextEditingController _name = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              title: Text("Flutter Practical"),
              centerTitle: true,
              backgroundColor: Colors.teal
          ),
          body: Center(
            child: Column(
              children: [
            (TextField (controller: _name)),
                ElevatedButton(onPressed: uploadData, child: Text("Submit"))
              ],
            ),
          ),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
  uploadData(){
    print(_name.text);
    final user = <String, dynamic>{
      "name" : _name.text
    };

// Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));

  }
}