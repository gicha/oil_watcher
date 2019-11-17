import 'package:flutter/material.dart';
import 'package:oil_watcher/blocs/blocs.dart';
import 'package:oil_watcher/models/models.dart';
import 'package:oil_watcher/res/res.dart';
import 'package:oil_watcher/res/text_style.dart';
import 'package:oil_watcher/screens/info/provider.dart';
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
  // blocs
  OilFormBloc oilFormBloc;
  //other
  InfoProvider provider;
  TextEditingController inputController;
  FocusNode focus;
  ScrollController scrollController;

  @override
  void initState() {
    oilFormBloc = OilFormBloc.getInstance();
    inputController = TextEditingController();
    focus = FocusNode();
    scrollController = ScrollController();
    provider = InfoProvider(oilFormBloc: oilFormBloc);
    super.initState();
  }

  @override
  void dispose() {
    oilFormBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ITColors.bg,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              SizedBox(height: 30),
              Text(
                widget.oilForm.company,
                style: ITTextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: ITColors.bg),
              ),
              SizedBox(height: 15),
              Text(
                "${widget.oilForm.summary} ${Utils.getNoun(((widget.oilForm.summary * 100) % 100).floor(), "балл", "балла", "баллов")}",
                style: ITTextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: ITColors.bg),
              ),
            ],
          ),
          elevation: 1,
          centerTitle: true,
          backgroundColor: ITColors.primary,
          textTheme: TextTheme(title: ITTextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: InfoView(provider: provider),
      )),
    );
  }
}
