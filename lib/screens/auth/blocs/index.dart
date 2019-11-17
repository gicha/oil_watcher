import 'package:bloc/bloc.dart';
import 'package:oil_watcher/blocs/blocs.dart';

abstract class AuthFormEvent {}

class EmailAuthFormEvent extends AuthFormEvent {
  final String email;
  EmailAuthFormEvent(this.email);
}

class PasswordAuthFormEvent extends AuthFormEvent {
  final String password;
  PasswordAuthFormEvent(this.password);
}

class SubmitAuthFormEvent extends AuthFormEvent {
  final String name;
  final String surname;
  SubmitAuthFormEvent({this.name, this.surname});
}

class SetPasswordVisibleAuthFormEvent extends AuthFormEvent {
  final bool visible;
  SetPasswordVisibleAuthFormEvent(this.visible);
}

class SetTypeAuthFormEvent extends AuthFormEvent {
  final bool isLogin;
  SetTypeAuthFormEvent(this.isLogin);
}

class AuthFormState {
  final String email, password;
  final bool isEmailValid, isPasswordValid;
  final bool isSubmitEnabled;
  final bool isError;
  final bool isPasswordVisible;

  AuthFormState([
    this.email,
    this.password,
    this.isEmailValid,
    this.isPasswordValid,
    this.isSubmitEnabled = false,
    this.isError = false,
    this.isPasswordVisible = false,
  ]);
  AuthFormState copyWith({
    String email,
    String password,
    String name,
    String surname,
    bool isEmailValid,
    bool isPasswordValid,
    bool isSubmitEnabled,
    bool isError,
    bool isPasswordVisible,
  }) {
    return AuthFormState(
      email ?? this.email,
      password ?? this.password,
      isEmailValid ?? this.isEmailValid,
      isPasswordValid ?? this.isPasswordValid,
      isSubmitEnabled,
      isError ?? this.isError,
      isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}

class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  @override
  AuthFormState get initialState => AuthFormState();

  @override
  Stream<AuthFormState> mapEventToState(AuthFormEvent event) async* {
    if (event is EmailAuthFormEvent && event.email != currentState.email) {
      bool isEmailValid = validateEmail(event.email);
      yield currentState.copyWith(
        email: event.email,
        isEmailValid: isEmailValid,
        isSubmitEnabled: currentState.isPasswordValid != null && isEmailValid && currentState.isPasswordValid,
        isError: false,
      );
    }

    if (event is PasswordAuthFormEvent && event.password != currentState.password) {
      bool isPasswordValid = event.password.length > 5;
      yield currentState.copyWith(
        password: event.password,
        isPasswordValid: isPasswordValid,
        isSubmitEnabled: currentState.isEmailValid != null && currentState.isEmailValid && isPasswordValid,
        isError: false,
      );
    }
    if (event is SubmitAuthFormEvent) {
      if (currentState.isEmailValid == true && currentState.isPasswordValid == true) {
        InitBloc.getInstance().dispatch(LoginInitEvent(currentState.email, currentState.password));
      } else
        yield currentState.copyWith(isSubmitEnabled: null, isError: true);
    }
    if (event is SetPasswordVisibleAuthFormEvent)
      yield currentState.copyWith(
          isPasswordVisible: event.visible ?? false, isSubmitEnabled: currentState.isSubmitEnabled);
  }
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return regex.hasMatch(value);
}
