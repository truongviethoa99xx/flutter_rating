//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> ShowAlertDialog(
BuildContext context,{
  @required String title,
  @required String content,
  String cancelActionText,
  @required String defaultActionText,
}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if(cancelActionText != null)
            TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(cancelActionText)
            ),
          TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(defaultActionText))
        ],
      )
  );
}