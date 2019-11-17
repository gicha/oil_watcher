import 'package:flutter/material.dart';
import 'package:oil_watcher/blocs/blocs.dart';
import 'package:oil_watcher/res/res.dart';
import 'package:oil_watcher/res/text_style.dart';
import 'package:oil_watcher/screens/main/provider.dart';
import 'package:oil_watcher/screens/main/view/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  RefreshController refreshController;

  @override
  void initState() {
    oilFormBloc = OilFormBloc.getInstance();
    refreshController = RefreshController(initialRefresh: false);
    provider = MainProvider(oilFormBloc: oilFormBloc, refreshController: refreshController);
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
        body: MainView(provider: provider),
      )),
    );
  }
}
