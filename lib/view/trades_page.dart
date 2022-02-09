import 'package:btb/view/profile_page/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/home/home_popup.dart';

class TradesPage extends StatefulWidget {
  const TradesPage({Key? key}) : super(key: key);

  @override
  State<TradesPage> createState() => _TradesPageState();
}

class _TradesPageState extends State<TradesPage> {
   late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose;
  }


  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Styles.primaryColor,
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // RichText(text: InlineSpan()),
                          Text(
                            r"+$60",
                            style: Styles.headlineText3!.copyWith(
                              fontSize: 18,
                              color: Styles.primaryColorLight,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "PnL for the past 24 hours",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.headlineText4!.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                controller: controller,
                shrinkWrap: true,
                itemCount: getTransactionList(context).length,
                itemBuilder: (BuildContext context, int index) {
                  return getTransactionList(context)[index];
                },
              ),
            ],
          ),
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
    "Transactions",
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

List<Widget> getTransactionList(BuildContext context) => [
      getCard("BTC/USDT", true),
      getCard("BNB/USDT", true),
      getCard("BNB/ADA", false),
      getCard("ETH/BUSD", true),
    ];

Widget getCard(String title, bool isBuy) {
  return Card(
    child: ListTile(
      title: Text(
        title,
        style: Styles.headlineText2,
      ),
      subtitle: Text(
        isBuy ? "Buy" : "Sell",
        style: Styles.bodyText2!.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: isBuy ? Colors.green[600] : Colors.red[600],
        ),
      ),
      trailing: Text(
        r"#35,000",
        style: Styles.bodyText2!.copyWith(
          fontSize: 10,
          color: isBuy ? Colors.green[600] : Colors.red[600],
          // color: Styles.primaryColorLight,
        ),
      ),
    ),
  );
}
