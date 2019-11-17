import 'package:auto_size_text/auto_size_text.dart';
import 'package:oil_watcher/generated/i18n.dart';
import 'package:oil_watcher/res/res.dart';
import 'package:oil_watcher/screens/auth/blocs/index.dart';
import 'package:oil_watcher/screens/auth/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final AuthFormBloc authFormBloc;

  const LoginForm({Key key, this.authFormBloc}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController(text: "");
  TextEditingController _passwordController = TextEditingController(text: "");

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  AuthFormBloc get authFormBloc => widget.authFormBloc;

  void submit() async {
    _emailFocus.unfocus();
    _passwordFocus.unfocus();
    authFormBloc.dispatch(SubmitAuthFormEvent());
  }

  @override
  void initState() {
    _emailController.addListener(() => authFormBloc.dispatch(EmailAuthFormEvent(_emailController.value.text)));
    _passwordController.addListener(() => authFormBloc.dispatch(PasswordAuthFormEvent(_passwordController.value.text)));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: true,
      child: BlocBuilder(
        bloc: authFormBloc,
        builder: (context, AuthFormState state) {
          return Column(
            children: <Widget>[
              if (state.isError == true) ...[
                Row(children: [
                  AutoSizeText(
                    I18n.of(context).wrongLoginOrPassword,
                    minFontSize: 15,
                    maxFontSize: 15,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ]),
                SizedBox(height: 15),
              ] else
                SizedBox(height: 40),
              AuthFormField(
                authFormBloc: authFormBloc,
                isError: state.isError,
                isPasswordVisible: state.isPasswordVisible,
                label: I18n.of(context).mail,
                controller: _emailController,
                focus: _emailFocus,
                submit: submit,
              ),
              SizedBox(height: 20),
              AuthFormField(
                authFormBloc: authFormBloc,
                isError: state.isError,
                isPasswordVisible: state.isPasswordVisible,
                label: I18n.of(context).password,
                controller: _passwordController,
                isPassword: true,
                focus: _passwordFocus,
                submit: submit,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .11),
              Container(
                width: double.infinity,
                height: 48,
                child: FlatButton(
                  child: Text(I18n.of(context).entry, style: TextStyle(color: ITColors.bgLight)),
                  disabledColor: ITColors.secondaryText,
                  color: ITColors.primaryDark,
                  onPressed: (state.isSubmitEnabled == true) ? submit : null,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
