import 'package:btb/view/calculator/calc.dart';
import 'package:btb/view/slider/add_slider_page.dart';
import 'package:btb/view/slider/slider_w.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/home/home_popup.dart';
import 'package:btb/view/mcq/mcq_categories.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:btb/view/mcq/pep_mcq.dart';
import 'package:btb/view/profile_page/profile_page.dart';
import 'package:btb/view/widgets/widgets.dart';
import 'package:btb/view/binance/spot.dart';

part 'dashboard_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            // const HomeSliderWidget(),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 8.0,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 7),
                  StaggeredGridView.countBuilder(
                    controller: controller,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(1),
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    itemCount: getTileList(context).length,
                    itemBuilder: (BuildContext context, int index) {
                      return getTileList(context)[index];
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Text('Transactions', style: Styles.headlineText2),
                  ),
                  StaggeredGridView.countBuilder(
                    controller: controller,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(1),
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    itemCount: getCoursesList().length,
                    itemBuilder: (BuildContext context, int index) =>
                        getCoursesList()[index],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar kAppBar = AppBar(
  bottomOpacity: 0,
  elevation: 0,
  centerTitle: true,
  title: Text(
    "BTB",
    style: Styles.headlineText2!.copyWith(
      fontWeight: FontWeight.w600,
    ),
  ),
  leading: IconButton(
    onPressed: () => Get.to(() => const ProfilePage()),
    icon: const Icon(Icons.person_outline),
  ),
  actions: [
    PopupMenuButton(
      onSelected: ProfilePopup.choiceAction,
      icon: const Icon(Icons.more_vert_rounded),
      color: Styles.canvasColor,
      itemBuilder: (BuildContext context) {
        return HomePopup.choices
            .map(
              (String choice) => PopupMenuItem(
                value: choice,
                child: Text(
                  choice,
                  style: Styles.headlineText2,
                ),
              ),
            )
            .toList();
      },
    ),
  ],
);
