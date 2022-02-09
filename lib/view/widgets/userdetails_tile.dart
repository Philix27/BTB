import 'package:cached_network_image/cached_network_image.dart';
import 'package:btb/core/app_users.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:flutter/material.dart';

Widget getUserInfo({
  required AppUser author,
  required String timePosted,
}) {
  return SizedBox(
    height: 50,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            // MyWidgets.dialog( AddTodoPopupCard());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: 30,
                width: 30,
                child: CachedNetworkImage(
                  imageUrl: author.profilePic,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(),
                  errorWidget: (context, url, error) => Container(),
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              author.username,
              style: author.adminTypes.contains("News")
                  ? Styles.subtitle1
                  : Styles.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: author.adminTypes.contains("News")
                      ? Colors.green
                      : Styles.canvasColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
  // ListTile(
  //   tileColor: Styles.canvasColor,
  //   onTap: () {
  //     MyWidgets.dialog(AddTodoPopupCard(user: author));
  //   },
  //   title: Text(
  //     author.username,
  //     style: author.adminTypes.contains("News")
  //         ? Styles.subtitle1
  //         : Styles.subtitle1,
  //   ),
  //   leading: CircleAvatar(
  //     radius: 20.0,
  //     backgroundImage: NetworkImage(author.profilePic),
  //     backgroundColor: Colors.transparent,
  //   ),
  //   trailing: Container(
  //     height: 10,
  //     width: 10,
  //     decoration: BoxDecoration(
  //       color: author.adminTypes.contains("News")
  //           ? Colors.green
  //           : Styles.canvasColor,
  //       borderRadius: BorderRadius.circular(5),
  //     ),
  //   ),
  // );
}

CircleAvatar getCircleAvatar(AppUser author) => CircleAvatar(
      radius: 20.0,
      backgroundImage: NetworkImage(author.profilePic),
      backgroundColor: Colors.transparent,
    );
