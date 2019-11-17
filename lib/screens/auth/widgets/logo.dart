import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo();

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/icons/logo.png', height: MediaQuery.of(context).size.height * .3);
  }
}
