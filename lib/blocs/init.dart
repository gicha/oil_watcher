part of blocs;

abstract class InitEvent {}

class InitInitEvent extends InitEvent {}

class LoginInitEvent extends InitEvent {
  final String login;
  final String password;
  LoginInitEvent(this.login, this.password);
}

class ForceInitEvent extends InitEvent {}

enum InitState { notInitedLoading, noUser, loading, inited }

class InitBloc extends Bloc<InitEvent, InitState> {
  static InitBloc _instance;
  static InitBloc getInstance() {
    if (_instance == null) _instance = InitBloc();
    return _instance;
  }

  @override
  InitState get initialState => InitState.notInitedLoading;

  @override
  Stream<InitState> mapEventToState(InitEvent event) async* {
    if (event is InitInitEvent) {
      yield InitState.notInitedLoading;
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      if (Platform.isAndroid)
        debugDefaultTargetPlatformOverride = TargetPlatform.android;
      else
        debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await init();
      var store = StoreRef<String, dynamic>.main();
      Config.company = await store.record("company").get(DataBase.db);
      yield Config.company != null ? InitState.inited : InitState.noUser;
      await Future.delayed(Duration(milliseconds: 1000));
    }
    if (event is LoginInitEvent) {
      yield InitState.loading;
      var store = StoreRef<String, dynamic>.main();
      init();
      if (event.login == "admin@rosneft.com" && event.password == "qwerty") {
        store.record("company").put(DataBase.db, "Роснефть");
        Config.company = event.login;
      } else {
        yield InitState.noUser;
        NotificationBloc.getInstance().dispatch(NotificationEvent("Неправильный email или пароль"));
      }
      if (Config.company != null) {
        Api.init();
        yield InitState.inited;
      }
    }
    if (event is ForceInitEvent) yield InitState.inited;
  }

  init() async {
    await DataBase().open();
    initializeDateFormatting();
    Api.init();
    OilFormBloc.getInstance().dispatch(FetchOilForm());
  }
}
