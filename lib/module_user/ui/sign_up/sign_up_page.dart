import 'package:chatia/module_user/bloc/cubit/user_cubit.dart';
import 'package:chatia/module_user/models/user_model.dart';
import 'package:chatia/module_user/ui/sign_up/widget/sign_up_button.dart';
import 'package:chatia/shared/validator.dart';
import 'package:chatia/shared/widget/messages.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: themeData.textTheme.headline2,
                textScaleFactor: 0.7,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                child: TextField(
                  style: const TextStyle(fontSize: 20),
                  controller: username,
                  decoration: const InputDecoration(hintText: "Username"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                child: TextField(
                  style: const TextStyle(fontSize: 20),
                  controller: email,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                child: TextField(
                  style: const TextStyle(fontSize: 20),
                  obscureText: true,
                  controller: password,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 30, bottom: 30),
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(fontSize: 20),
                  controller: password2,
                  decoration:
                      const InputDecoration(hintText: "Confirm Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    if (Validator.checkEmail(email.text) == false) {
                      PopMessages.showSnackBar(context, "Invalid Email");
                    } else if (Validator.checkUsername(username.text)) {
                      PopMessages.showSnackBar(context, "Invalid username");
                    } else if (Validator.checkPassword(password.text)) {
                      PopMessages.showSnackBar(context, "Invalid password");
                    } else if (password.text != password2.text) {
                      PopMessages.showSnackBar(
                          context, "password are not same");
                    } else {
                      userCubit.signUp(
                        User(email.text, password.text,
                            username: username.text,
                            img: null,
                            lastSeen: DateTime.now(),
                            online: true),
                      );
                    }
                  },
                  child: Container(
                    width: size.width,
                    height: 55,
                    decoration: BoxDecoration(
                        color: themeData.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    alignment: Alignment.center,
                    child: const SignUpButtonWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

UserCubit userCubit = UserCubit(UserInitial());
