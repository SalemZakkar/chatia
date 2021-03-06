import 'package:chatia/shared/widget/divider.dart';
import 'package:flutter/material.dart';

import '../../../module_user/models/user_model.dart';
import '../../../shared/widget/online_status.dart';
import '../../../shared/widget/profile_image_card.dart';

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
          child: SizedBox(
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


