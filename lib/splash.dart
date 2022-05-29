import 'package:chatia/app_router.dart';
import 'package:chatia/constants/app_string.dart';
import 'package:chatia/module_user/repository/user_repository.dart';
import 'package:flutter/material.dart';

void startApp(BuildContext context) async {
  String state = await UserRepository.signInFromMemory();

  if (state == AppStrings.firebaseEmailWrong ||
      state == AppStrings.fireBaseWrongPassword ||
      state == AppStrings.fireBaseUserNotFound) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRouter.welcome, (route) => false);
  } else {}
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startApp(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Welcome To Chatia App",
                  style: themeData.textTheme.headline2,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.6,
                )),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
