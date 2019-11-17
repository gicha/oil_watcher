import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oil_watcher/blocs/blocs.dart';
import 'package:oil_watcher/screens/main/provider.dart';

class MainView extends StatefulWidget {
  const MainView({Key key, @required this.provider}) : super(key: key);
  final MainProvider provider;

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainProvider get provider => widget.provider;
  OilFormBloc get formBloc => provider.oilFormBloc;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  Widget build(BuildContext context) {
    return Container(
      width: width,
    );
  }
}
