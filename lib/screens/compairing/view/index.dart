import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:oil_watcher/models/models.dart';
import 'package:oil_watcher/res/res.dart';

class CompairingView extends StatefulWidget {
  const CompairingView({Key key, @required this.oilForms}) : super(key: key);
  final List<OilForm> oilForms;

  @override
  _CompairingViewState createState() => _CompairingViewState();
}

class _CompairingViewState extends State<CompairingView> {
  List<OilForm> get oilForms => widget.oilForms;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: SingleChildScrollView(
        child: Table(
            children: List.generate(oilForms.length, (rowIndex) {
          return TableRow(
            children: List.generate(oilForms[rowIndex].answers.length, (columnIndex) {
              return Container(
                child: Text(oilForms[rowIndex].answers[columnIndex].point),
              );
            }),
          );
        })),
      ),
    );
  }

  Widget answerItem(BuildContext context, Answer answer) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      width: width * .45,
      child: Column(
        children: <Widget>[
          if (answer.point == "2") Icon(LineIcons.check, color: ITColors.primary, size: 30),
          if (answer.point == "1") Icon(LineIcons.warning, color: Colors.yellowAccent, size: 30),
          if (answer.point == "0") Icon(LineIcons.close, color: Colors.redAccent, size: 30),
          SizedBox(height: 10),
          Text(
            answer.question,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
