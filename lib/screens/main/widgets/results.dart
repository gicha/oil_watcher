import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oil_watcher/models/models.dart';
import 'package:oil_watcher/res/res.dart';
import 'package:oil_watcher/res/text_style.dart';
import 'package:oil_watcher/screens/info/index.dart';
import 'package:page_transition/page_transition.dart';

class Results extends StatelessWidget {
  final List<OilForm> forms;

  const Results({Key key, this.forms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Column(
          children: List.generate(forms.length, (index) {
            return resultRow(context, index, forms[index]);
          }),
        ));
  }

  Widget resultRow(BuildContext context, int place, OilForm form) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).push(PageTransition(type: PageTransitionType.fade, child: InfoScreen(oilForm: form))),
      child: Container(
        color: ITColors.bg,
        child: Column(children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: (MediaQuery.of(context).size.width) * .2,
                alignment: Alignment.center,
                child: Text(
                  (place + 1).toString(),
                  style: ITTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) * .4,
                alignment: Alignment.center,
                child: Text(
                  form.company,
                  style: ITTextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) * .4,
                alignment: Alignment.center,
                child: Text(
                  form.summary.toStringAsFixed(2),
                  style: ITTextStyle(fontSize: 16, color: form.summary > 1 ? ITColors.primaryDark : Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(),
        ]),
      ),
    );
  }
}
