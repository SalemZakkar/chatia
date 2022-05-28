import 'dart:io';

import 'package:chatia/module_user/api/user_api.dart';
import 'package:chatia/module_user/ui/settings/settings.dart';
import 'package:chatia/module_user/ui/settings/view_photo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ModalWidget extends StatefulWidget {
  const ModalWidget({Key? key}) : super(key: key);

  @override
  State<ModalWidget> createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(22), topLeft: Radius.circular(22)),
          color: Theme.of(context).scaffoldBackgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () async {
              PickedFile? picked = await ImagePicker.platform
                  .pickImage(source: ImageSource.gallery);
              if (picked != null) {
                File file = File(picked.path);
                photoCubit.changePhoto(file);
                Navigator.pop(context);
              }
            },
            child: Ink(
              color: Colors.red,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Change Photo",
                      style: Theme.of(context).textTheme.headline2,
                      textScaleFactor: 0.4,
                    ),
                  )),
            ),
          ),
          InkWell(
            onTap: () async {
              photoCubit.deletePhoto();
              Navigator.pop(context);
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Delete",
                    style: Theme.of(context).textTheme.headline2,
                    textScaleFactor: 0.4,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
