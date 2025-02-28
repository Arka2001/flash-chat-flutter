import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  // ignore: non_constant_identifier_names
  RoundedButton({@required this.text,@required this.color,@required this.OnPressed});

  final String text;
  // ignore: non_constant_identifier_names
  final Function OnPressed;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: OnPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}