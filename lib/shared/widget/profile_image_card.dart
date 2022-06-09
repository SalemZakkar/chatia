import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import 'loading.dart';

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
