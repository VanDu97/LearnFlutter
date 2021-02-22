import 'package:flutter/material.dart';

class Car {
  String name;
  int yearOfProduction;
  // Car(String name, int yearOfProduction) {
  //   this.name = name;
  //   this.yearOfProduction = yearOfProduction;
  // }
  Car({@required this.name, this.yearOfProduction});
  @override
  String toString() {
    return '${this.name} - ${this.yearOfProduction}';
  }

  void doSomething() {
    print('I\'m doing something');
    this.handleEvent();
  }

  void sayHello({String name}) {
    print('Hello ${name}');
  }

  //functions as a variable
  Function handleEvent;
}
