import 'package:flutter/material.dart';
import 'package:oil_watcher/models/models.dart';
import 'package:oil_watcher/res/res.dart';
import 'package:oil_watcher/res/text_style.dart';
import 'package:oil_watcher/screens/compairing/view/index.dart';
import 'package:oil_watcher/utils/utils.dart';

/// Compairing Screen
/// {@category Screens}
class CompairingScreen extends StatefulWidget {
  final List<OilForm> oilForms;

  const CompairingScreen({Key key, this.oilForms}) : super(key: key);
  @override
  _CompairingScreenState createState() => _CompairingScreenState();
}

class _CompairingScreenState extends State<CompairingScreen> {
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
            child: Text(
              "Сравнение",
              style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: ITColors.bg),
            ),
          ),
          elevation: 1,
          centerTitle: true,
          backgroundColor: ITColors.primary,
          primary: true,
          textTheme: TextTheme(title: ITTextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: CompairingView(oilForms: widget.oilForms),
      )),
    );
  }
}
