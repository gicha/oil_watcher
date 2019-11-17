import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oil_watcher/res/text_style.dart';

class TableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF0F1F5),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width) * .2,
            alignment: Alignment.center,
            child: Text(
              "Место",
              style: ITTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width * .4),
            alignment: Alignment.center,
            child: Text(
              "Компания",
              style: ITTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width) * .4,
            // alignment: Alignment.centerRight,
            child: Text(
              "Итоговый балл",
              style: ITTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
