part of blocs;

enum LoadStatus { loading, loaded, error }

abstract class OilFormEvent {}

class FetchOilForm extends OilFormEvent {}

class OilFormState {
  List<OilForm> oilForm = [];
  OilForm myForm;
  int place;
  LoadStatus loadStatus = LoadStatus.loaded;

  OilFormState();

  OilFormState copyWith({
    List<OilForm> oilForm,
    OilForm myForm,
    int place,
    LoadStatus loadStatus = LoadStatus.loaded,
  }) {
    return OilFormState()
      ..oilForm = oilForm ?? this.oilForm
      ..myForm = myForm ?? this.myForm
      ..place = place ?? this.place
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
      List<OilForm> oilForms = await OilFormApi.all();
      OilForm myForm;
      int place;
      oilForms.sort((OilForm a, OilForm b) => ((b.summary - a.summary) * 100).floor());
      for (int i = 0; i < oilForms.length; i++) {
        if (oilForms[i].company == Config.company) {
          myForm = oilForms[i];
          place = i + 1;
        }
      }
      yield currentState.copyWith(oilForm: oilForms, myForm: myForm, place: place, loadStatus: LoadStatus.loaded);
    }
  }
}
