import 'package:flutter/material.dart';

class OriginalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final Color sidecolor;

  OriginalButton(
      {required this.text,
      required this.onPressed,
      required this.color,
      required this.textColor,
      required this.sidecolor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            elevation: 10,
            side: BorderSide(color: sidecolor),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30))),
        onPressed: onPressed,
        child: new FittedBox(
          //fit long text
          fit: BoxFit.contain,
          child:
              new Text(text, style: TextStyle(color: textColor, fontSize: 18)),
        ),
      ),
    );
  }
}
