import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutters/firebaseData.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'circleAdd.dart';
import 'list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: '네비게이션',
    home: First(),
  ));
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('첫 번째')),
      body: Center(
          child: Column(children: [
        RaisedButton(
          child: Text('두 번째 화면으로 이동', style: TextStyle(fontSize: 21)),
          color: Colors.blue,
          onPressed: () {
            // push에 전달되는 두 번째 매개변수는 Route<T> 클래스.
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return listApp();
            }));

            // 화살표 문법 적용
            // Navigator.push(context,
            // MaterialPageRoute<void>(builder: (BuildContext context) => Second())
            // );

            // 위와 같은 코드. of 메소드 호출이 불편하다.
            // Navigator.of(context).push(
            // MaterialPageRoute<void>(builder: (BuildContext context) => Second())
            // );
          },
        ),
        RaisedButton(
          child: Text('두 번째 화면으로 이동', style: TextStyle(fontSize: 21)),
          color: Colors.blue,
          onPressed: () {
            // push에 전달되는 두 번째 매개변수는 Route<T> 클래스.
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return CircleAdd();
            }));

            // 화살표 문법 적용
            // Navigator.push(context,
            // MaterialPageRoute<void>(builder: (BuildContext context) => Second())
            // );

            // 위와 같은 코드. of 메소드 호출이 불편하다.
            // Navigator.of(context).push(
            // MaterialPageRoute<void>(builder: (BuildContext context) => Second())
            // );
          },
        ),
        RaisedButton(
          child: Text('test', style: TextStyle(fontSize: 21)),
          color: Colors.blue,
          onPressed: () {
            // push에 전달되는 두 번째 매개변수는 Route<T> 클래스.
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return TestPage();
            }));

            // 화살표 문법 적용
            // Navigator.push(context,
            // MaterialPageRoute<void>(builder: (BuildContext context) => Second())
            // );

            // 위와 같은 코드. of 메소드 호출이 불편하다.
            // Navigator.of(context).push(
            // MaterialPageRoute<void>(builder: (BuildContext context) => Second())
            // );
          },
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            final f = FirebaseFirestore.instance;
            await f.collection('circle').doc('circles1').set({
              'title': '음악 동아리',
              'content': '음악을 좋아하시는 분들 오세용',
              'image': 'https://randomuser.me/api/portraits/men/41.jpg'
            });
            print("됫니?");
          },
          child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: Text('보내기', style: TextStyle(fontSize: 25))),
        )
      ])),
    );
  }
}
