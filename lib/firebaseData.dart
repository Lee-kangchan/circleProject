import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TestPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello world"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child:
                  Text("create button", style: TextStyle(color: Colors.white)),
              onPressed: () async {
                print("됫니?");
                final f = FirebaseFirestore.instance;
                await f.collection('circle').doc('circles').set({
                  'title': '음악 동아리',
                  'content': '음악을 좋아하시는 분들 오세용',
                  'image': 'https://randomuser.me/api/portraits/men/41.jpg'
                });
                print("됫니?");
              },
            ),
            FlatButton(
              color: Colors.blue,
              child: Text("read button", style: TextStyle(color: Colors.white)),
              onPressed: () async {
                print("됫니?");
                final f = FirebaseFirestore.instance;
                await f
                    .collection('circle')
                    .where("circle")
                    .get()
                    .then((QuerySnapshot ds) {
                  for (var masage in ds.docs) {
                    print(masage.get("title"));
                  }
                });
                print("됫니?");
              },
            ),
            FlatButton(
              color: Colors.blue,
              child:
                  Text("update button", style: TextStyle(color: Colors.white)),
              onPressed: () {
                //클릭시 데이터를 갱신해준다.
              },
            ),
            FlatButton(
              color: Colors.blue,
              child:
                  Text("delete button", style: TextStyle(color: Colors.white)),
              onPressed: () {
                //클릭시 데이터를 삭제해 준다.
              },
            ),
          ],
        ),
      ),
    );
  }
}
