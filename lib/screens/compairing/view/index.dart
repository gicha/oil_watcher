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

  List<List<String>> table;

  Widget build(BuildContext context) {
    prepareTable();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {
            0: FixedColumnWidth(width * .5),
            1: FixedColumnWidth(width * .25),
            2: FixedColumnWidth(width * .25)
          },
          defaultColumnWidth: FixedColumnWidth(200),
          children: List.generate(
            table.length,
            (rowIndex) => TableRow(
              children: List.generate(
                table[rowIndex].length,
                (columnIndex) => answerCell(
                  context,
                  rowIndex,
                  columnIndex,
                  table[rowIndex][columnIndex],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget answerCell(BuildContext context, int i, int j, String value) {
    Widget child;
    if (value == "2")
      child = Icon(LineIcons.check, color: ITColors.primary, size: 30);
    else if (value == "1")
      child = Icon(LineIcons.warning, color: Colors.yellowAccent, size: 30);
    else if (value == "0")
      child = Icon(LineIcons.close, color: Colors.redAccent, size: 30);
    else
      child = Text(value);
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1, color: ITColors.text),
      color: ITColors.bg,
      // ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: child,
    );
  }

  prepareTable() {
    table = List<List<String>>();
    if (oilForms.isNotEmpty) {
      List<String> companies = ["Компания"];
      List<String> titles = [];
      for (OilForm oilForm in oilForms) companies.add(oilForm.company.trim());
      for (Answer answer in oilForms.first.answers) titles.add(answer.question);
      table.add(companies);
      for (int i = 1; i <= titles.length; i++) {
        table.add([titles[i - 1]]);
        for (int j = 1; j < companies.length; j++) table[i].add(oilForms[j - 1].answers[i - 1].point);
      }
    }
  }
}
