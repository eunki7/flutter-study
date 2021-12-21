import 'dart:async';

import 'package:flutter/material.dart';
import 'rabbit.dart';

class StatefulSampleWidget extends StatefulWidget {

  String title;
  Rabbit rabbit;
  int value;

  StatefulSampleWidget({Key? key, required this.title, required this.rabbit,  required this.value}) : super(key: key);

  @override
  _StatefulSampleWidgetState createState() => _StatefulSampleWidgetState();
}

class _StatefulSampleWidgetState extends State<StatefulSampleWidget> {

  bool stateBool = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("_StatefulSampleWidgetState init state!!");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose!!');
    super.dispose();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    print("didchange dependencies!!");
    print(MediaQuery.of(context).size);
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    if(mounted) {
      print("Setstate!!");
    }
  }

  @override
  void didUpdateWidget(covariant StatefulSampleWidget oldWidget) {
    // TODO: implement didUpdateWidget
    print("old : ${oldWidget.value} <> cur : ${widget.value}");
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      print('didUpdateWidget!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build!!");
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            stateBool = !stateBool;
          });
        },
        child: Text("Button"),
      ),
    );
  }
}
