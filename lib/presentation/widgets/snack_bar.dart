import 'package:flutter/material.dart';

void appSnack(BuildContext context, String content) {
  var snackBar =
      SnackBar(backgroundColor: Colors.black, content: Text(content));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
