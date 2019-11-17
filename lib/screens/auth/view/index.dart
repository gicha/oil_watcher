import 'package:oil_watcher/screens/auth/blocs/index.dart';
import 'package:oil_watcher/screens/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oil_watcher/screens/auth/widgets/logo.dart';

class LoginAuthScreenView extends StatefulWidget {
  const LoginAuthScreenView({Key key, this.bloc}) : super(key: key);
  final AuthFormBloc bloc;

  @override
  _LoginAuthScreenViewState createState() => _LoginAuthScreenViewState();
}

class _LoginAuthScreenViewState extends State<LoginAuthScreenView> {
  AuthFormBloc get bloc => widget.bloc;
  void submit() async => bloc.dispatch(SubmitAuthFormEvent());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(height: 45),
              Logo(),
              Container(height: 25),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) => LoginForm(authFormBloc: bloc),
              ),
              Container(height: 45),
              if (MediaQuery.of(context).viewInsets.bottom == 0) Container(),
            ],
          ),
        ),
      ),
    );
  }
}
