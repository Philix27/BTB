import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:btb/core/global_variables.dart';
import 'package:btb/core/theme/styles.dart';

Widget productCount() {
  return StreamBuilder<QuerySnapshot>(
    stream: MyGlobals.productsCollection.orderBy("brandName").snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Text(
          "Product ....",
          style: Styles.headlineText2,
        );
      } else {
        return dashboardCardTile(
          uptext: "Products",
          downText: "${snapshot.data!.docs.length}",
        );
      }
    },
  );
}

Widget getProductAppBarTitle() {
  return StreamBuilder<QuerySnapshot>(
    stream: MyGlobals.productsCollection.orderBy("brandName").snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Text(
          "Product Count ....",
          style: Styles.headlineText2,
        );
      } else {
        return Text(
          "Products: ${snapshot.data!.docs.length}",
          style: Styles.headlineText2,
        );
      }
    },
  );
}

Widget dashboardCardTile({required String uptext, required String downText}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Spacer(),
      Text(
        uptext,
        style: Styles.headlineText2,
      ),
      const Spacer(),
      Text(
        downText,
        style: Styles.headlineText2,
      ),
      const Spacer(),
    ],
  );
}

Widget coloredDashboardCardTile(
    {required String uptext, required String downText}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Spacer(),
      Text(
        uptext,
        style: Styles.headlineText4,
      ),
      const Spacer(),
      Text(
        downText,
        style: Styles.headlineText4,
      ),
      const Spacer(),
    ],
  );
}
