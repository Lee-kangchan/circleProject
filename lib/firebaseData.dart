import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

var name = "??";

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TestPage"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(name),
              ElevatedButton(
                  onPressed: () async {
                    DocumentSnapshot test1docData = await firebaseFirestore
                        .collection('circle')
                        .doc('circle1doc')
                        .get();
                    setState(() {
                      name = test1docData['title'];
                    });
                  },
                  child: Text("Data 불러오기"))
            ],
          ),
        ),
      ),
    );
  }
}
