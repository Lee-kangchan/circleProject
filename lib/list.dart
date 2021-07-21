// import 'package:flutter/material.dart';

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutters/circleInsert.dart';
import 'package:flutters/pageInfo.dart';
import 'package:flutter/material.dart';

class listApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("circle list"),
      ),
      body: Center(
        child: listdata(context),
      ),
    );
  }
}

final f = FirebaseFirestore.instance;

Future<Widget> listdata(BuildContext context) async {
  List<PageInfo> list = [];
  PageInfo pageInfo =
      new PageInfo("https://randomuser.me/api/portraits/men/41.jpg", "", "");
  f.collection('circle').where("circle").get().then((QuerySnapshot ds) {
    for (var masage in ds.docs) {
      pageInfo.title = masage.get("title");
      pageInfo.group = masage.get("content");
      list.add(pageInfo);
      print(masage.get("title"));
    }
    print(list.length);
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        return _tile(list[i].title, list[i].group, context);
      },
    );
  });
  print('aaasasdasd여기는 오지만');
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, i) {
      return _tile(list[i].title, list[i].group, context);
    },
  );
}

Widget _buildList(BuildContext context) => ListView(children: [
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
      _tile("hello", "nice meet you", context),
    ]);

ListTile _tile(String title, String content, BuildContext context) => ListTile(
      title: Text(title),
      subtitle: Text(content),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: _userImage(Images[Random().nextInt(Images.length)])),
      onTap: () {
        PageInfo info = new PageInfo(
            "https://randomuser.me/api/portraits/men/41.jpg", title, content);
        var key;
        Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => Detail(info: info)));
      },
    );

ClipRRect _userImage(String url) => ClipRRect(
    borderRadius: BorderRadius.circular(100), child: Image.network(url));

final Images = [
  "https://randomuser.me/api/portraits/men/41.jpg",
  "https://randomuser.me/api/portraits/women/26.jpg",
  "https://randomuser.me/api/portraits/men/16.jpg",
  "https://randomuser.me/api/portraits/women/49.jpg",
  "https://randomuser.me/api/portraits/men/23.jpg",
  "https://randomuser.me/api/portraits/women/47.jpg",
  "https://randomuser.me/api/portraits/men/40.jpg",
  "https://randomuser.me/api/portraits/women/17.jpg",
  "https://randomuser.me/api/portraits/men/12.jpg",
  "https://randomuser.me/api/portraits/women/72.jpg",
];

// 상세보기 화면 클래스
// 실제로는 더 많은 데이터가 전달되어야 하지만, 여기서는 3가지만 사용.
class Detail extends StatelessWidget {
  final PageInfo info;

  // key는 부모 클래스에서 사용하는 기본 옵션
  Detail({key, required this.info}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(info.title)),
      body: SingleChildScrollView(
        // 없으면, 화면을 벗어났을 때 볼 수 없음 (스크롤 지원)
        child: Column(
          children: <Widget>[
            Center(
              child: Image.network(info.image,
                  width: 300, height: 300, fit: BoxFit.contain),
            ),
            Container(
              child: Text(
                "소개글 : " + info.group,
                style: TextStyle(fontSize: 21.0, color: Colors.black87),
              ),
              padding: EdgeInsets.all(20.0),
            ),
            RaisedButton(
              child: Text("가입하기"),
              onPressed: () {
                // push에 전달되는 두 번째 매개변수는 Route<T> 클래스.
                Navigator.push(context,
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return CircleInsert();
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
          ],
        ),
      ),
    );
  }
}
