import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double? width;
  final Color? dividerColor;
  const DividerWidget({Key? key, this.width, this.dividerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.8,
      height: 0.3,
      color: dividerColor ?? Theme.of(context).dividerColor,
    );
  }
}
