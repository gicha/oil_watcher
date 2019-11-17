import 'package:flutter/material.dart';
import 'package:oil_watcher/blocs/blocs.dart';
import 'package:oil_watcher/res/res.dart';
import 'package:oil_watcher/res/text_style.dart';
import 'package:oil_watcher/screens/main/provider.dart';
import 'package:oil_watcher/screens/main/view/index.dart';

/// Main Screen
/// {@category Screens}
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // blocs
  OilFormBloc oilFormBloc;
  //other
  MainProvider provider;
  TextEditingController inputController;
  FocusNode focus;
  ScrollController scrollController;

  @override
  void initState() {
    oilFormBloc = OilFormBloc.getInstance();
    inputController = TextEditingController();
    focus = FocusNode();
    scrollController = ScrollController();
    provider = MainProvider(oilFormBloc: oilFormBloc);
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
          title: Text('Oil Watcher', style: ITTextStyle(fontSize: 12)),
          elevation: 1,
          centerTitle: true,
          backgroundColor: ITColors.bg,
          textTheme: TextTheme(title: ITTextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: MainView(provider: provider),
      )),
    );
  }
}
