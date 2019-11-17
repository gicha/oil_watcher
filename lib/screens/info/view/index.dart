import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oil_watcher/blocs/blocs.dart';
import 'package:oil_watcher/screens/info/provider.dart';

class InfoView extends StatefulWidget {
  const InfoView({Key key, @required this.provider}) : super(key: key);
  final InfoProvider provider;

  @override
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  InfoProvider get provider => widget.provider;
  OilFormBloc get formBloc => provider.oilFormBloc;
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: formBloc,
        builder: (context, OilFormState state) {
          return Container(
            width: width,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }
}
