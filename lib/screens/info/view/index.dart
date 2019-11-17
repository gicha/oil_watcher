import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:oil_watcher/blocs/blocs.dart';
import 'package:oil_watcher/models/models.dart';
import 'package:oil_watcher/res/res.dart';
import 'package:oil_watcher/screens/info/widgets/table_header.dart';

class InfoView extends StatefulWidget {
  const InfoView({Key key, @required this.oilForm}) : super(key: key);
  final OilForm oilForm;

  @override
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  OilForm get oilForm => widget.oilForm;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: SingleChildScrollView(
        child: Wrap(
          spacing: width * .05,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            TableHeader(),
            ...List.generate(oilForm.answers.length, (index) {
              return answerItem(context, oilForm.answers[index]);
            }),
            SizedBox(height: 50, width: width),
          ],
        ),
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
