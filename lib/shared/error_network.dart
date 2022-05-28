import 'package:flutter/material.dart';

class ErrorNetworkIcon extends StatelessWidget {
  const ErrorNetworkIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.wifi_off,
      color: Theme.of(context).errorColor,
    );
  }
}
