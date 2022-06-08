import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatia/constants/assets.dart';
import 'package:chatia/shared/widget/divider.dart';
import 'package:chatia/shared/widget/loading.dart';
import 'package:flutter/material.dart';

import '../../../module_user/models/user_model.dart';

class UserCard extends StatefulWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Container(
            width: size.width,
            height: 80,
            child: Row(
              children: [
                image(widget.user.img, context),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.username ?? "",
                      style: themeData.textTheme.subtitle1,
                      textScaleFactor: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    getOnline(widget.user.online ?? false)
                  ],
                )
              ],
            ),
          ),
        ),
        const DividerWidget()
      ],
    );
  }
}

Widget image(String? url, BuildContext context) {
  return CachedNetworkImage(
    imageUrl: url ?? "",
    fit: BoxFit.cover,
    alignment: Alignment.center,
    imageBuilder: (context, prov) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image(
          image: prov,
          fit: BoxFit.cover,
          alignment: Alignment.center,
          width: 70,
          height: 70,
        ),
      );
    },
    placeholder: (context, url) => Container(
      width: 70,
      height: 70,
      alignment: Alignment.center,
      child: const Loading(),
    ),
    errorWidget: (context, a, b) => ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.asset(
        AppAssets.profile,
        width: 70,
        height: 70,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget getOnline(bool online) {
  if (online) {
    return const Text(
      "Online",
      style: TextStyle(color: Colors.green),
      textScaleFactor: 1,
    );
  }
  return const Text(
    "offline",
    style: TextStyle(color: Colors.redAccent),
    textScaleFactor: 1,
  );
}
