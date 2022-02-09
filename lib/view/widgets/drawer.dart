import 'package:btb/core/theme/styles.dart';
// import 'package:btb/view/drugs_needed/drugs_needed.dart';
// import 'package:btb/view/expenses/expenses_section.dart';
// import 'package:btb/view/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

Widget getDrawerListTile({
  required String title,
  required void Function() goTo,
}) {
  return ListTile(
    title: Text(
      title,
      style: Styles.headlineText2,
    ),
    onTap: goTo,
  );
}

Widget getDrawerHeaderListTile({
  required String title,
  required void Function() goTo,
}) {
  return ListTile(
    tileColor: Styles.backgroundColor,
    title: Text(
      title,
      style: Styles.headlineText2,
    ),
    onTap: goTo,
  );
}

/// Placed in the widgets folder -- Copied from Delsu Tv v1
// / [v1]).

Widget buildDrawer(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.3,
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(height: 40, color: Styles.primaryColor),
          getDrawerHeaderListTile(goTo: () {}, title: 'More'),

          getDrawerListTile(goTo: () {}, title: 'Theme'),
          const Divider(),

          // getDrawerListTile(goTo: ratingFunc(), title: 'Rate App'),
          // const Divider(),
        ],
      ),
    ),
  );
}
