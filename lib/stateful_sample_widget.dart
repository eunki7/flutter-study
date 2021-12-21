import 'dart:async';

import 'package:flutter/material.dart';

import 'rabbit.dart';

class StatefulSampleWidget extends StatefulWidget {

  String title;
  Rabbit rabbit;

  StatefulSampleWidget({Key? key, required this.title, required this.rabbit}) : super(key: key);

  @override
  _StatefulSampleWidgetState createState() => _StatefulSampleWidgetState();
}

class _StatefulSampleWidgetState extends State<StatefulSampleWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      int index = timer.tick % 4;
      print(index);

      setState(() {
        switch (index) {
          case 0:
            widget.rabbit.updateState(RabbitState.SLEEP);
            break;
          case 1:
            widget.rabbit.updateState(RabbitState.WALK);
            break;
          case 2:
            widget.rabbit.updateState(RabbitState.RUN);
            break;
          case 3:
            widget.rabbit.updateState(RabbitState.EAT);
            break;
        }
        print(widget.rabbit.state);
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text(widget.title)),
      body: Container(
          child: Center(
            child: Text(
                widget.rabbit.state.toString(),
                style: TextStyle(
                    fontSize: 20
                )),
          )
      ),
    );
  }
}
