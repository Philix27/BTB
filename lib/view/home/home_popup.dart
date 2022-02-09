import 'package:btb/view/auth/update_user_profile.dart';
import 'package:btb/view/profile_page/profile_page.dart';
import 'package:btb/view/widgets/widgets.dart';

class HomePopup {
  static const String editprofile = 'Edit Profile';
  static const String customerCare = 'Tech Support';
  static const String notification = 'Notifications';
  static const String addCard = 'AddCard';

  static const List<String> choices = [
    editprofile,
    customerCare,
    notification,
    addCard,
  ];

  static void choiceAction(String choice) {
    if (choice == addCard) {
      MyWidgets.getBack();
      // MyWidgets.goTo(const AddPaymentCard());
    } else if (choice == customerCare) {
      MyWidgets.getBack();
      MyWidgets.goTo(const SuggestionPage());
    } else if (choice == editprofile) {
      MyWidgets.getBack();
      MyWidgets.goTo(const UpdateUserPage());
    }
  }
}
