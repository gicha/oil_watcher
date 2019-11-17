import 'package:flutter/material.dart';
import 'package:oil_watcher/blocs/blocs.dart';
import 'package:oil_watcher/blocs/blocs.dart' as bloc;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainProvider {
  MainProvider({@required this.oilFormBloc, @required this.refreshController});

  // blocs
  final OilFormBloc oilFormBloc;

  // controllers
  final RefreshController refreshController;

  void setLoadStatus(bloc.LoadStatus status) {
    try {
      if (status == bloc.LoadStatus.loaded) refreshController.refreshCompleted();
      if (status == bloc.LoadStatus.error) refreshController.refreshFailed();
    } catch (e) {}
  }
}
