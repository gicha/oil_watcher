import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oil_watcher/models/models.dart';
import 'package:oil_watcher/res/res.dart';
import 'package:oil_watcher/res/text_style.dart';
import 'package:oil_watcher/utils/config.dart';
import 'package:page_transition/page_transition.dart';

class InfoCard extends StatelessWidget {
  final OilForm myForm;
  final int place;

  const InfoCard({Key key, this.myForm, this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4,
      color: ITColors.primaryDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.width - 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Config.company,
              style: ITTextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: ITColors.bg),
            ),
            SizedBox(height: 10),
            Text(
              place == null ? "" : "$place место",
              style: ITTextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: ITColors.bg),
            ),
            SizedBox(height: 10),
            Text(
              place == null ? "" : "Вашу компанию можно считать экологичной!",
              style: ITTextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: ITColors.bg),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
