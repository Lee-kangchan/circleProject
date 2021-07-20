import 'package:flutter/material.dart';
import 'circleAdd.dart';
import 'list.dart';

void main() {
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
        )
      ])),
    );
  }
}
