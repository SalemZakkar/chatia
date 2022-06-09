// ignore_for_file: unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatia/module_user/bloc/cubit/user_cubit.dart';
import 'package:chatia/module_user/ui/settings/widgets/modal_widget.dart';
import 'package:chatia/shared/widget/error_network.dart';
import 'package:chatia/shared/widget/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/assets.dart';
import '../../../../shared/widget/loading.dart';

class ViewUserPhoto extends StatefulWidget {
  const ViewUserPhoto({Key? key}) : super(key: key);

  @override
  State<ViewUserPhoto> createState() => _ViewUserPhotoState();
}

UserCubit photoCubit =
    UserCubit(UserInitialPhoto(FirebaseAuth.instance.currentUser?.photoURL));

class _ViewUserPhotoState extends State<ViewUserPhoto> {
  bool pressable = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(500),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (pressable) {
          showModalBottomSheet(
              context: context, builder: (context) => const ModalWidget());
          // pressable = false;

        }
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.5,
        height: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(250)),
        child: BlocProvider<UserCubit>(
          create: (context) {
            photoCubit = UserCubit(
                UserInitialPhoto(FirebaseAuth.instance.currentUser?.photoURL));
            return photoCubit;
          },
          child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
            if (state is UserError) {
              WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
                photoCubit.resetPhoto();
                PopMessages.showSnackBar(context, "No Network");
              });
            }
            if (state is UserInitialPhoto) {
              pressable = true;
              return getPhoto(state.url);
            } else if (state is UserLoading) {
              pressable = false;
              return const Center(
                child: Loading(),
              );
            } else {
              pressable = true;
              photoCubit.resetPhoto();
              return getPhoto(FirebaseAuth.instance.currentUser?.photoURL);
            }
          }),
        ),
      ),
    );
  }
}

Widget getPhoto(String? url) {
  if (url == null || url == "") {
    return ClipRRect(
      borderRadius: BorderRadius.circular(250),
      child: Image.asset(
        AppAssets.profile,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  } else {
    return CachedNetworkImage(
      placeholder: (context, url) => const Loading(),
      imageUrl: url,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      imageBuilder: (context, provider) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(250),
          child: Image(
            image: provider,
            fit: BoxFit.cover,
          ),
        );
      },
      errorWidget: (context, error, dd) {
        return const ErrorNetworkIcon();
      },
    );
  }
}
