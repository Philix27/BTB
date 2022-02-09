import 'package:btb/view/slider/add_slider_page.dart';
import 'package:btb/view/slider/slider_m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:btb/controller/user_controller.dart';
import 'package:btb/core/global_variables.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/widgets/loading.dart';
import 'package:btb/view/widgets/widgets.dart';

class AllNotifications extends StatelessWidget {
  const AllNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Styles.headlineText2,
        ),
        centerTitle: true,
      ),
      floatingActionButton: MyWidgets.fab(
          icon: Icons.add,
          onTap: () {
            Get.to(() => const AddSlider());
          }),
      body: StreamBuilder(
        stream:
            MyGlobals.homeBannerCollection.orderBy("timePosted").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Loading.spinKitThreeBounce();
          } else if (snapshot.data!.docs.isEmpty) {
            return Text(
              "Empty",
              style: Styles.bodyText2,
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot postDoc = snapshot.data!.docs[index];

                final HomeSliderModel slide = HomeSliderModel.fromMap(
                    postDoc.data() as Map<String, dynamic>);
                return Dismissible(
                  key: Key(UniqueKey().toString()),
                  onDismissed: (direction) {
                    if (Get.find<UserController>()
                        .user
                        .adminTypes
                        .contains("Manager")) {
                      HomeSliderModel.deleteItem(slide.docID);
                    }
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Styles.warningColor,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Card(
                      child: ListTile(
                        isThreeLine: true,
                        title: Text(
                          slide.title,
                          maxLines: 1,
                          style: Styles.headlineText2,
                        ),
                        subtitle: Text(
                          slide.details,
                          maxLines: 2,
                          style: Styles.headlineText2!.copyWith(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
