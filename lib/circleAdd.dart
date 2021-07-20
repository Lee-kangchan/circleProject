import 'package:flutter/material.dart';

class CircleAdd extends StatefulWidget {
  CircleAdd() : super();

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<CircleAdd> {
  final controller = TextEditingController(text: 'init');

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      print(controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("동아리 생성하기")),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: controller,
                ),
                RaisedButton(
                    child: Text("생성"),
                    onPressed: () {
                      print(controller.text);
                      controller.clear();
                    })
              ],
            )));
  }
}
