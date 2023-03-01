
import 'package:flutter/material.dart';
import 'package:musicapp/Constant/colors.dart';
import 'package:musicapp/Widgets/spacers.dart';
import 'custom_text.dart';
import 'fade_in_image.dart';

Widget trackWidget({
  required String name,
  required String icon,
  required String title,
  required String timeline,
  required String count,
}) {
  return SizedBox(
    width: 220,
    child: Card(
      elevation: 2.0,
      margin: const EdgeInsets.only(right: 10, left: 5, bottom: 10, top: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          head(icon: icon, name: name),
          timelineimage(timeline),
          trackTitle(title),
          playcount(count),
        ],
      ),
    ),
  );
}

Widget playcount(String count) {
  return Padding(
    padding: const EdgeInsets.only(right: 15, bottom: 5, top: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomText(text: 'Played', color: grey, size: 12),
            verticalSpace(height: 7),
            CustomText(text: count+' times', color: blue, size: 13.5),
          ],
        ),
      ],
    ),
  );
}

Widget trackTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
    child: CustomText(
      text: title,
      size: 14,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget timelineimage(String path) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
    child: SizedBox(height: 75, child: FadeInImageWidget(image: path)),
  );
}

Widget head({
  required String icon,
  required String name,
}) {
  return SizedBox(
    child: ListTile(
      horizontalTitleGap: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: CustomText(
          text: name,
          size: 13,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(icon),
          radius: 18,
          onBackgroundImageError: (object, stack) =>
              const Icon(Icons.info_outline_rounded),
        ),
      ),
    ),
  );
}


