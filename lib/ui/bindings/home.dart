import 'package:get/get.dart';
import 'package:getxtest/exp/exp_controllers.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(UsersController());
  }
}