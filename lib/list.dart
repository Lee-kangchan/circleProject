// import 'package:flutter/material.dart';

import 'dart:math';

import 'package:circleproject/pageInfo.dart';
import 'package:flutter/material.dart';

class listApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("circle list"),
      ),
      body: Center(
        child: _buildList(context),
      ),
    );
  }
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

class Choice {
  Choice(this.text, this.icon);
  final String text;
  final IconData icon;

  // 매개변수를 전달할 때 {}가 있다면 매개변수 이름을 생략할 수 없다.
  // Choice({this.title, this.icon});
}

// 탭바와 탭바뷰 양쪽에서 사용하기 위한 공통 데이터 리스트.
// Choice 생성자에 {}를 사용하지 않았기 때문에 매개변수 이름이 없다.
final choices = [
  Choice('PLANE', Icons.flight),
  Choice('CAR', Icons.directions_car),
  Choice('BIKE', Icons.directions_bike),
  Choice('BOAT', Icons.directions_boat),
  Choice('BUS', Icons.directions_bus),
  Choice('TRAIN', Icons.directions_railway),
  Choice('WALK', Icons.directions_walk),
];

// 상세보기 화면 클래스
// 실제로는 더 많은 데이터가 전달되어야 하지만, 여기서는 3가지만 사용.
class Detail extends StatelessWidget {
  // key는 부모 클래스에서 사용하는 기본 옵션
  Detail({Key? key, required this.info}) : super(key: key);
  final PageInfo info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(info.group)),
      body: SingleChildScrollView(
        // 없으면, 화면을 벗어났을 때 볼 수 없음 (스크롤 지원)
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  info.title,
                  style: TextStyle(fontSize: 21.0, color: Colors.black87),
                ),
              ),
              padding: EdgeInsets.all(20.0),
            ),
            Container(
              child: Image.asset(info.image, fit: BoxFit.contain),
              padding: EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
