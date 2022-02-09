import 'package:btb/view/profile_page/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/home/home_popup.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0
              // vertical: 8,
              ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
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
                          RichText(
                            text: TextSpan(
                              text: r"$6,000",
                              style: Styles.headlineText3!.copyWith(
                                fontSize: 18,
                                color: Styles.primaryColorLight,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Account Balance",
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
                itemCount: getCoinsBalanceList(context).length,
                itemBuilder: (BuildContext context, int index) {
                  return getCoinsBalanceList(context)[index];
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
    "Wallet",
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

List<Widget> getCoinsBalanceList(BuildContext context) => [
      getCard("Bitcoin", onTap: () {}),
      getCard("USDT", onTap: () {}),
      getCard("BNB", onTap: () {}),
      getCard("Etherum", onTap: () {}),
    ];

Widget getCard(String title, {VoidCallback? onTap}) {
  return Card(
    child: ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: Styles.headlineText2,
      ),
      subtitle: Text(
        r"$20,000",
        style: Styles.bodyText2!.copyWith(
          fontSize: 10,
          color: Styles.primaryColorLight,
        ),
      ),
      trailing: Text(
        r"#35,000",
        style: Styles.bodyText2!.copyWith(
          fontSize: 10,
          // color: Styles.primaryColorLight,
        ),
      ),
    ),
  );
}
