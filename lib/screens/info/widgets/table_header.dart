import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oil_watcher/res/text_style.dart';

class TableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xFFF0F1F5),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              "1. Экологический менеджмент",
              style: ITTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
