import 'package:oil_watcher/res/res.dart';
import 'package:oil_watcher/screens/auth/blocs/index.dart';
import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField(
      {Key key,
      this.controller,
      this.focus,
      this.isPasswordVisible,
      this.isError,
      this.authFormBloc,
      this.isPassword = false,
      this.label,
      this.submit})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focus;
  final AuthFormBloc authFormBloc;
  final bool isPasswordVisible;
  final bool isError;
  final bool isPassword;
  final String label;
  final Function submit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        TextFormField(
          controller: controller,
          focusNode: focus,
          obscureText: !(isPasswordVisible == true) && isPassword,
          keyboardType: TextInputType.text,
          textInputAction: isPassword ? TextInputAction.done : TextInputAction.next,
          onFieldSubmitted: (term) => submit(),
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: isError ? BorderSide(width: 2) : BorderSide(),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: isError ? BorderSide(width: 2) : BorderSide(),
            ),
          ),
        ),
        if (isPassword)
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 12),
                padding: EdgeInsets.all(3),
                child: Icon(Icons.remove_red_eye,
                    color: (isPasswordVisible == true) ? ITColors.primaryDark : ITColors.secondaryText),
              ),
              onTap: () => authFormBloc.dispatch(
                SetPasswordVisibleAuthFormEvent(
                  !(isPasswordVisible == true),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
