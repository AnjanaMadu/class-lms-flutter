import 'package:flutter/material.dart';

// Inside your Widget class or function:
showAlertDialog(
  BuildContext context,
  String content, [
  Function? ok,
  Function? cancel,
]) async {
  // Show the AlertDialog and wait for the button press
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              cancel ?? Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              // Close the dialog and return 'Yes' as the result
              ok ?? Navigator.of(context).pop();
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}
