import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:ip_api/utilities/constants.dart';

class ErrorAlert {
  ErrorAlert({required this.context});
  final BuildContext context;

  buildAlert() {
    return Alert(
      style: kAlertStyle,
      context: context,
      type: AlertType.error,
      title: 'ERROR!',
      desc: 'Please check network connection!',
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          color: Color(0xFF241E44),
          child: const Text(
            'OK!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    );
  }
}
