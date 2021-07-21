import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CircleAdd extends StatefulWidget {
  CircleAdd() : super();

  @override
  _CircleState createState() => _CircleState();
}

class _CircleState extends State<CircleAdd> {
  final title = TextEditingController(text: 'init');
  final content = TextEditingController(text: 'init');

  @override
  void initState() {
    // TODO: implement initState
    title.addListener(() {
      print(title.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    title.dispose();
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
                      hintText: "동아리 명을 입력하세요",
                      labelText: "동아리 명"),
                  controller: title,
                ),
                TextField(
                  maxLines: 8,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.content_paste),
                    hintText: "소개 글을 입력하세요 ",
                    labelText: "소개 글",
                  ),
                  controller: content,
                ),
                RaisedButton(
                    child: Text("생성"),
                    onPressed: () async {
                      print(title.text);
                      final f = FirebaseFirestore.instance;
                      await f.collection('circle').doc().set({
                        'title': title.text,
                        'content': content.text,
                        'image':
                            'https://randomuser.me/api/portraits/men/41.jpg'
                      });
                      print("됫니?");
                      content.clear();
                    })
              ],
            )));
  }
}
