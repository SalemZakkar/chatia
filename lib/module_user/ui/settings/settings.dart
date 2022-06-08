import 'package:chatia/app_router.dart';
import 'package:chatia/module_user/bloc/cubit/user_cubit.dart';
import 'package:chatia/module_user/repository/user_repository.dart';
import 'package:chatia/module_user/ui/settings/loading.dart';
import 'package:chatia/module_user/ui/settings/widgets/dark_mode_switch.dart';
import 'package:chatia/module_user/ui/settings/widgets/view_photo.dart';
import 'package:chatia/shared/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

String? imgUrl;
UserCubit userCubit =
    UserCubit(UserInitialPhoto(FirebaseAuth.instance.currentUser?.photoURL));

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    // TODO: implement initState
    imgUrl = FirebaseAuth.instance.currentUser?.photoURL;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: const ViewUserPhoto()),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Text(
                  FirebaseAuth.instance.currentUser?.displayName ?? "n/a",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline2?.color),
                  textScaleFactor: 1.5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Text(
                  FirebaseAuth.instance.currentUser?.email ?? "n/a",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headline2?.color),
                  textScaleFactor: 1.5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const ThemeSwitchWidget(),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) => const SettingsLoading(),
                      barrierDismissible: false);
                  if (await UserRepository.logOut(fullLogout: true)) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRouter.welcome, (route) => false);
                  } else {
                    PopMessages.showSnackBar(context, "No Network Connection");
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
