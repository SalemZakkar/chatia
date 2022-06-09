import 'package:chatia/shared/widget/divider.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widget/profile_image_card.dart';

class GroupCard extends StatefulWidget {
  const GroupCard({Key? key}) : super(key: key);

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
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
                image("widget.user.img", context),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Group name",
                      style: themeData.textTheme.subtitle1,
                      textScaleFactor: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Message",
                      style: TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    )
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
