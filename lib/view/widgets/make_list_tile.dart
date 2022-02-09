import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/widgets/loading.dart';

class MakeListTile extends StatelessWidget {
  final List<String> imageList;
  final String title;
  final String? subtitle;
  final Widget? trailWidget;
  final VoidCallback imageGoTo;

  const MakeListTile({
    Key? key,
    required this.imageList,
    required this.title,
    this.subtitle,
    this.trailWidget,
    required this.imageGoTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 5.0,
        top: 3.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: imageGoTo,
                  child: Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageList[0],
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Loading.spinKitThreeBounce(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.bodyText2,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
