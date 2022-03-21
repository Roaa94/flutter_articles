import 'package:flutter/material.dart';

class AppBarFlutterLogo extends StatelessWidget {
  const AppBarFlutterLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Image.asset(
        'assets/images/flutter-green-logo.png',
        width: 35,
      ),
    );
  }
}
