import 'package:btb/core/app_users.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
// import 'package:btb/view/daily_sales/cart_controller.dart';
// import 'package:btb/view/market/product_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    //? Core
    // Get.put<AuthController>(AuthController(), permanent: true);
    // Get.put<UserController>(UserController(), permanent: true);
    //? Services
    //? UI
    // Get.put<ProductController>(ProductController(), permanent: true);
    // Get.put<CartController>(CartController(), permanent: true);
    // ? Leave the two controllers underneath
    //? FCM
  }
}

AppUser appUser = Get.find<AppUser>();
// AuthController authController = Get.find<AuthController>();
