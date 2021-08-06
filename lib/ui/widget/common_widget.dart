import 'package:flutter/material.dart';

void showSnackbar(message, _scaffoldKey) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(milliseconds: 3000),
  );
  _scaffoldKey.currentState.showSnackBar(snackBar);
}
