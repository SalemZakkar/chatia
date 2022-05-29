import 'dart:io';
import 'package:chatia/module_user/ui/settings/widgets/view_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
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
              // ignore: invalid_use_of_visible_for_testing_member
              PickedFile? picked = await ImagePicker.platform
                  .pickImage(source: ImageSource.gallery);
              if (picked != null) {
                File? file =
                    await cropImage(File(picked.path), Theme.of(context));
                if (file != null) {
                  photoCubit.changePhoto(file);
                }
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

Future<File?> cropImage(File file, ThemeData themeData) async {
  CroppedFile? res = await ImageCropper.platform.cropImage(
      sourcePath: file.path,
      compressQuality: 50,
      cropStyle: CropStyle.rectangle,
      aspectRatioPresets: [
        CropAspectRatioPreset.square
      ],
      uiSettings: [
        AndroidUiSettings(
            backgroundColor: themeData.scaffoldBackgroundColor,
            cropFrameColor: Colors.yellow,
            toolbarColor: themeData.cardColor,
            toolbarWidgetColor: themeData.textTheme.subtitle1?.color,
            activeControlsWidgetColor: themeData.primaryColor,
            hideBottomControls: true)
      ]);
  if (res != null) {
    return File(res.path);
  }
  return null;
}
