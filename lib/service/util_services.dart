import 'package:flutter/material.dart';

class UtilService {
  static Future showDialogBox(
      BuildContext context, String title, String message,
      {List<Widget>? actions}) {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          width: 270.0,
          child: new AlertDialog(
            title: new Text(title),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text(message),
                ],
              ),
            ),
            actions: actions ??
                <Widget>[
                  new FlatButton(
                    child: new Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
          ),
        );
      },
    );
  }

  static void showSnackBar(scaffoldKey, message, {Duration? duration}) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration ?? Duration(milliseconds: 3000),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  static void navigateBack(BuildContext context, {result}) {
    return Navigator.pop(context, result);
  }

  static Future navigateTo(BuildContext context, Widget screen) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }


  static Future navigateToAndPopAll(BuildContext context, Widget screen) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => screen,
        ),
        (Route<dynamic> route) => false);
  }
}
