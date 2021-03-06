import 'dart:async';

import 'package:ex1/rabbit.dart';
import 'package:ex1/stateful_sample_widget.dart';
import 'package:ex1/stateless_sample_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        value++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: StatelessSampleWidget(
      //   title : "구멍이 없는 박스로 실험하는자",
      //   rabbit : Rabbit(name : "개남토끼1", state : RabbitState.SLEEP)
      // ),
      home: value > 10 ?
      Container() :
      StatefulSampleWidget(
          title : "구멍이 있는 박스로 실험하는자",
          value: value,
          rabbit : Rabbit(name : "개남토끼2", state : RabbitState.SLEEP)
      ),
    );
  }
}