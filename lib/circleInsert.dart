import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CircleInsert extends StatefulWidget {
  CircleInsert() : super();

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<CircleInsert> {
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
                  decoration: const InputDecoration(
                      icon: Icon(Icons.assignment_ind_outlined),
                      hintText: "동아리 가입 이유를 적으시오",
                      labelText: "가입 이유"),
                  controller: controller,
                ),
                RaisedButton(
                    child: Text("가입하기"),
                    onPressed: () async {
                      print(controller.text);
                      final f = FirebaseFirestore.instance;
                      await f
                          .collection('circleInsert')
                          .doc()
                          .set({'title': '음악 동아리', 'reason': controller});
                      print("됫니?");
                      controller.clear();
                    })
              ],
            )));
  }
}
