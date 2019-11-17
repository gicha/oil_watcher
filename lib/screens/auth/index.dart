import 'package:oil_watcher/screens/auth/blocs/index.dart';
import 'package:oil_watcher/screens/auth/view/index.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthFormBloc bloc;
  @override
  void initState() {
    bloc = AuthFormBloc();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginAuthScreenView(
        bloc: bloc,
      ),
    );
  }
}
