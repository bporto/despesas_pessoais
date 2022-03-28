import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController textController;
  final Function() onSubmit;
  final String lable;
  final TextInputType keyboardType;

  const AdaptativeTextField({
    Key? key,
    required this.textController,
    required this.onSubmit,
    required this.lable,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CupertinoTextField(
              controller: textController,
              keyboardType: keyboardType,
              onSubmitted: (_) {
                onSubmit;
              },
              placeholder: lable,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            controller: textController,
            keyboardType: keyboardType,
            onSubmitted: (_) {
              onSubmit;
            },
            decoration: InputDecoration(
              labelText: lable,
            ),
          );
  }
}
