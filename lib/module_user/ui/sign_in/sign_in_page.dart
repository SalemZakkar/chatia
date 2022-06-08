import 'package:chatia/module_user/bloc/cubit/user_cubit.dart';
import 'package:chatia/module_user/models/user_model.dart';
import 'package:chatia/module_user/ui/sign_in/widget/sign_in_button.dart';
import 'package:chatia/shared/messages.dart';
import 'package:chatia/shared/validator.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign In",
                style: themeData.textTheme.headline2,
                textScaleFactor: 0.9,
              ),
              SizedBox(
                height: size.height * 0.2,
              ),
              TextField(
                decoration: const InputDecoration(hintText: "Email"),
                controller: email,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: password,
                decoration: const InputDecoration(hintText: "password"),
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () async {
                  if (Validator.checkUsername(email.text)) {
                    PopMessages.showSnackBar(context, "Invalid Email");
                  } else if (Validator.checkPassword(password.text)) {
                    PopMessages.showSnackBar(context, "Invalid Password");
                  } else {
                    userCubit.signIn(User(email.text, password.text));
                  }
                },
                child: Container(
                  width: size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: themeData.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: const SignInButton(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

UserCubit userCubit = UserCubit(UserInitial());
