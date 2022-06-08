import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final Color? color;

  const Loading({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 3,
      color: color ?? Theme.of(context).primaryColor,
    );
  }
}
