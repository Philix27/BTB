import 'package:cached_network_image/cached_network_image.dart';
import 'package:btb/controller/user_controller.dart';
import 'package:btb/core/global_variables.dart';
import 'package:btb/core/theme/styles.dart';
import 'package:btb/view/auth/update_user_profile.dart';
import 'package:btb/view/widgets/custom_list_tile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:btb/view/widgets/loading.dart';
import 'package:btb/view/widgets/widgets.dart';
import 'package:get/get.dart';

part 'suggestion_page.dart';
part 'profile_body.dart';
part 'profile_popup.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: Styles.headlineText3),
        elevation: 0.0,
        actions: [
          PopupMenuButton(
            onSelected: ProfilePopup.choiceAction,
            icon: const Icon(Icons.more_vert_rounded),
            color: Styles.canvasColor,
            itemBuilder: (BuildContext context) {
              return ProfilePopup.choices
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
      ),
      body: ProfileBody(),
    );
  }
}
