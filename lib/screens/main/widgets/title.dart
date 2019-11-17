import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oil_watcher/res/text_style.dart';

class DashBoardTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Text(
            "Рейтинг 2019",
            style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 15),
          Text(
            "Ваш результат",
            style: ITTextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
