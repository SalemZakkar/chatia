import 'package:chatia/app_router.dart';
import 'package:chatia/module_user/bloc/cubit/user_cubit.dart';
import 'package:chatia/module_user/ui/sign_up/sign_up_page.dart';
import 'package:chatia/shared/widget/loading.dart';
import 'package:chatia/shared/widget/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButtonWidget extends StatefulWidget {
  const SignUpButtonWidget({Key? key}) : super(key: key);

  @override
  State<SignUpButtonWidget> createState() => _SignUpButtonWidgetState();
}

class _SignUpButtonWidgetState extends State<SignUpButtonWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return BlocProvider(
      create: (context) {
        userCubit = UserCubit(UserInitial());
        return userCubit;
      },
      child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        if (state is UserInitial) {
          return Text(
            "Sign Up",
            style: themeData.textTheme.bodyText1,
          );
        } else if (state is UserLoading) {
          return const Loading(
            color: Colors.white,
          );
        } else if (state is UserError) {
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            userCubit.reset();
            PopMessages.showSnackBar(context, state.message);
          });
          return Text(
            "Sign Up",
            style: themeData.textTheme.bodyText1,
          );
        } else if (state is UserDone) {
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            userCubit.reset();
            Navigator.pushNamedAndRemoveUntil(
                context, AppRouter.home, (route) => false);
          });

          return Text(
            "Sign Up",
            style: themeData.textTheme.bodyText1,
          );
        } else {
          return Text(
            "Sign Up",
            style: themeData.textTheme.bodyText1,
          );
        }
      }),
    );
  }
}
