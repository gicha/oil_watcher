import 'package:flutter/material.dart';
import 'package:oil_watcher/models/models.dart';
import 'package:oil_watcher/res/res.dart';
import 'package:oil_watcher/res/text_style.dart';
import 'package:oil_watcher/screens/info/view/index.dart';
import 'package:oil_watcher/utils/utils.dart';

/// Info Screen
/// {@category Screens}
class InfoScreen extends StatefulWidget {
  final OilForm oilForm;

  const InfoScreen({Key key, this.oilForm}) : super(key: key);
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ITColors.bg,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(bottom: 0),
            width: MediaQuery.of(context).size.width * .6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.oilForm.company,
                  style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: ITColors.bg),
                ),
                Text(
                  "${widget.oilForm.summary} ${Utils.getNoun(((widget.oilForm.summary * 100) % 100).floor(), "балл", "балла", "баллов")}",
                  style: ITTextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: ITColors.bg),
                ),
              ],
            ),
          ),
          elevation: 1,
          centerTitle: true,
          backgroundColor: ITColors.primary,
          primary: true,
          textTheme: TextTheme(title: ITTextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: InfoView(oilForm: widget.oilForm),
      )),
    );
  }
}
