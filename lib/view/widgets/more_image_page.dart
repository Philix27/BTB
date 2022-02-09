import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:btb/core/theme/styles.dart';

class MoreImagePage extends StatelessWidget {
  final List<String> imageList;
  const MoreImagePage({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '1btb',
          style: Styles.headlineText1,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Styles.canvasColor,
      ),
      body: Swiper(
        layout: SwiperLayout.STACK,
        itemHeight: MediaQuery.of(context).size.height,
        itemWidth: MediaQuery.of(context).size.width,
        itemCount: imageList.length,
        viewportFraction: 0.8,
        scale: 0.8,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imageList[index],
                  ),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }
}
