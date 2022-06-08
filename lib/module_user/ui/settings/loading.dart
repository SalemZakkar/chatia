import 'package:chatia/shared/widget/loading.dart';
import 'package:flutter/material.dart';

class SettingsLoading extends StatefulWidget {
  const SettingsLoading({Key? key}) : super(key: key);

  @override
  State<SettingsLoading> createState() => _SettingsLoadingState();
}

class _SettingsLoadingState extends State<SettingsLoading> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        color: Theme.of(context).cardColor.withOpacity(0.3),
        child: const Loading(),
      ),
    );
  }
}
