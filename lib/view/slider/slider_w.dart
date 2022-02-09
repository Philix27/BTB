import 'package:btb/view/slider/slider_m.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:btb/core/global_variables.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/widgets/loading.dart';

class HomeSliderWidget extends StatefulWidget {
  const HomeSliderWidget({Key? key}) : super(key: key);

  @override
  _HomeSliderWidgetState createState() => _HomeSliderWidgetState();
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: MyGlobals.homeBannerCollection.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Loading.spinKitThreeBounce();
        } else if (snapshot.data!.docs.isEmpty) {
          return Container();
        } else {
          return CarouselSlider.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index, int u) {
              final DocumentSnapshot postDoc = snapshot.data!.docs[index];

              final HomeSliderModel slide = HomeSliderModel.fromMap(
                  postDoc.data() as Map<String, dynamic>);
              if (slide.isImage) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      imageUrl: slide.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: Loading.spinKitThreeBounce()),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: slide.colorCode,
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            slide.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.headlineText3!.copyWith(fontSize: 13),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            slide.details,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.headlineText4!.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
            options: CarouselOptions(
              height: 120,
              viewportFraction: 0.9,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 7),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
            ),
          );
        }
      },
    );
  }
}
