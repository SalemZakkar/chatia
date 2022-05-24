import 'package:flutter/material.dart';

class PopMessages {
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Theme.of(context).cardColor,
    ));
  }
}
