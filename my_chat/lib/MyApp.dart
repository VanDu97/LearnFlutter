import 'package:flutter/material.dart';
import 'dart:io';

class MyApp extends StatefulWidget {
  String name;
  int age;
  //statelesswidget state not changed and re-render.
  MyApp({this.name, this.age});
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String _email = "";
  final emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Now add a state
    return MaterialApp(
        title: 'This is a StatefulWidget',
        home: Scaffold(
            body: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: emailEditingController,
                  onChanged: (text) {
                    this.setState(() {
                      _email = text;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10))),
                      labelText: 'Enter your email.'),
                )),
            Text("$_email", style: TextStyle(fontSize: 30, color: Colors.red)),
            Text("Name = ${widget.name}, age = ${widget.age}",
                style: TextStyle(fontSize: 30, color: Colors.blue)),
            Text("Name = ${widget.name}, age = ${widget.age}",
                style: TextStyle(fontSize: 30, color: Colors.blueAccent)),
          ],
        ))));
  }
}
