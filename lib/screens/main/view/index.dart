import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oil_watcher/blocs/blocs.dart';
import 'package:oil_watcher/screens/main/provider.dart';
import 'package:oil_watcher/screens/main/widgets/info_card.dart';
import 'package:oil_watcher/screens/main/widgets/results.dart';
import 'package:oil_watcher/screens/main/widgets/table_header.dart';
import 'package:oil_watcher/screens/main/widgets/title.dart';

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
    return BlocBuilder(
        bloc: formBloc,
        builder: (context, OilFormState state) {
          return Container(
            width: width,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  DashBoardTitle(),
                  InfoCard(myForm: state.myForm, place: state.place),
                  SizedBox(height: 20),
                  TableHeader(),
                  Results(forms: state.oilForm),
                ],
              ),
            ),
          );
        });
  }
}
