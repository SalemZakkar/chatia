import 'package:chatia/app_router.dart';
import 'package:chatia/module_user/bloc/user_cubit.dart';
import 'package:chatia/module_user/ui/sign_in/sign_in_page.dart';
import 'package:chatia/shared/loading.dart';
import 'package:chatia/shared/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return BlocProvider(
      create: (context){
        return userCubit;
      },
      child: BlocBuilder<UserCubit , UserState>(
        builder: (context , state)
        {
          if(state is UserLoading)
            {
              return const Loading(color: Colors.white,);
            }
          else if(state is UserDone)
            {
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                Navigator.pushNamedAndRemoveUntil(context, AppRouter.home, (route) => false);

              });
              return Text(
                "Sign In",
                style: themeData.textTheme.bodyText1,
              );
            }
          else if(state is UserError)
            {
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                PopMessages.showSnackBar(context, state.message);
              });
              return Text(
                "Sign In",
                style: themeData.textTheme.bodyText1,
              );
            }
          else{
            return Text(
              "Sign In",
              style: themeData.textTheme.bodyText1,
            );
          }
        },
      ),
    );
  }
}
