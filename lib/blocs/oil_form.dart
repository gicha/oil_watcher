part of blocs;

enum LoadStatus { loading, loaded, error }

abstract class OilFormEvent {}

//событие получения сообщений
class FetchOilForm extends OilFormEvent {}

//событие очистки сообщений
class CleanOilForm extends OilFormEvent {}

//событие отправки сообщений
class SendOilForm extends OilFormEvent {
  final String oilForm;
  SendOilForm({this.oilForm});
}

class OilFormState {
  List<OilForm> oilForm = [];
  String newOilForm;
  bool hasReachedMax;
  LoadStatus loadStatus = LoadStatus.loaded;

  OilFormState();

  OilFormState copyWith({
    List<OilForm> oilForm,
    String newOilForm,
    bool hasReachedMax,
    LoadStatus loadStatus = LoadStatus.loaded,
  }) {
    return OilFormState()
      ..oilForm = oilForm ?? this.oilForm
      ..newOilForm = newOilForm ?? this.newOilForm
      ..hasReachedMax = hasReachedMax ?? this.hasReachedMax
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
      await Future.delayed(Duration(seconds: 2));
      yield currentState.copyWith(oilForm: oilForm, loadStatus: LoadStatus.loaded);
    }
    if (event is CleanOilForm) {
      yield currentState.copyWith(oilForm: []);
    }
  }
}
