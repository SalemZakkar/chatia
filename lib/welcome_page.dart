import 'package:chatia/app_router.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Welcome To Chatia App",
                  style: themeData.textTheme.headline2,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.6,
                )),
            SizedBox(
              height: size.height * 0.25,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.pushNamed(context, AppRouter.signUp);
              },
              child: Container(
                width: size.width * 0.5,
                height: 50,
                decoration: BoxDecoration(
                    color: themeData.iconTheme.color,
                    borderRadius: BorderRadius.circular(50)),
                alignment: Alignment.center,
                child: Text(
                  "Sign Up",
                  style: themeData.textTheme.bodyText1,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.pushNamed(context, AppRouter.signIn);
              },
              child: Container(
                width: size.width * 0.5,
                height: 50,
                decoration: BoxDecoration(
                    color: themeData.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                alignment: Alignment.center,
                child: Text(
                  "Sign In",
                  style: themeData.textTheme.bodyText1,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
