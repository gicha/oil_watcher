import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oil_watcher/blocs/blocs.dart';
import 'package:oil_watcher/blocs/blocs.dart' as prefix0;
import 'package:oil_watcher/screens/compairing/index.dart';
import 'package:oil_watcher/screens/main/provider.dart';
import 'package:oil_watcher/screens/main/widgets/info_card.dart';
import 'package:oil_watcher/screens/main/widgets/results.dart';
import 'package:oil_watcher/screens/main/widgets/table_header.dart';
import 'package:oil_watcher/screens/main/widgets/title.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
    return SmartRefresher(
        enablePullDown: true,
        controller: provider.refreshController,
        onRefresh: () => formBloc.dispatch(FetchOilForm()),
        child: BlocBuilder(
            bloc: formBloc,
            builder: (context, OilFormState state) {
              try {
                provider.setLoadStatus(state.loadStatus);
              } catch (e) {}
              return Container(
                  width: width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(PageTransition(
                              type: PageTransitionType.fade, child: CompairingScreen(oilForms: state.oilForm))),
                          child: InfoCard(myForm: state.myForm, place: state.place),
                        ),
                        SizedBox(height: 20),
                        TableHeader(),
                        Results(forms: state.oilForm),
                      ],
                    ),
                  ));
            }));
  }
}
