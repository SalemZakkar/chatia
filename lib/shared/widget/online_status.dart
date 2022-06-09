import 'package:flutter/material.dart';

Widget getOnline(bool online) {
  if (online) {
    return const Text(
      "Online",
      style: TextStyle(color: Colors.green),
      textScaleFactor: 1,
    );
  }
  return const Text(
    "offline",
    style: TextStyle(color: Colors.redAccent),
    textScaleFactor: 1,
  );
}
