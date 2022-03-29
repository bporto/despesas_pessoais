import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String lable;
  final Function() onPressed;

  const AdaptativeButton({
    required this.lable,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(lable),
            onPressed: onPressed,
            color: Colors.purple,
            padding: const EdgeInsets.all(12),
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(
              lable,
              style: const TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            ),
          );
  }
}
