part of blocs;

enum LoadStatus { loading, loaded, error }

abstract class OilFormEvent {}

class FetchOilForm extends OilFormEvent {}

class OilFormState {
  List<OilForm> oilForm = [];
  LoadStatus loadStatus = LoadStatus.loaded;

  OilFormState();

  OilFormState copyWith({
    List<OilForm> oilForm,
    LoadStatus loadStatus = LoadStatus.loaded,
  }) {
    return OilFormState()
      ..oilForm = oilForm ?? this.oilForm
      ..loadStatus = loadStatus ?? this.loadStatus;
  }
}

class OilFormBloc extends Bloc<OilFormEvent, OilFormState> {
  static OilFormBloc _instance;
  static OilFormBloc getInstance() {
    if (_instance == null) _instance = OilFormBloc();
    return _instance;
  }

  @override
  OilFormState get initialState => OilFormState();
  NotificationBloc notificationBloc = NotificationBloc.getInstance();

  @override
  Stream<OilFormState> mapEventToState(OilFormEvent event) async* {
    if (event is FetchOilForm) {
      yield currentState.copyWith(loadStatus: LoadStatus.loading);
      List<OilForm> oilForm = await OilFormApi.all();
      yield currentState.copyWith(oilForm: oilForm, loadStatus: LoadStatus.loaded);
    }
  }
}
