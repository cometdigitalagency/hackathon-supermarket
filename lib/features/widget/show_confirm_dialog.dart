import 'package:flutter/material.dart';

Future<void> showConfirmDialog({
  required BuildContext context,
  required String title,
  required String content,
  TextStyle? styleTitle,
  required Function() onPress,
}) async =>
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1)),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            title: Text(
              title,
              style: styleTitle,
            ),
            content: Text(content),
            actions: [
              TextButton(
                child: const Text("cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onPress();
                },
                child: const Text("confirm"),
              ),
            ],
          ),
        );
      },
    );
