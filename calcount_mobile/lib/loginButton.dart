import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class loginButton extends StatelessWidget {
  loginButton({@required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.red,
      splashColor: Colors.redAccent[100],
      child: Padding(
      padding: const EdgeInsets.symmetric(
      horizontal: 8.0,
      vertical: 20.0,
      ),
      child: Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    onPressed: onPressed,
    shape: const StadiumBorder(),
    );
  }
}