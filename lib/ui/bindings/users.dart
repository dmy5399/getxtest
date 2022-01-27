import 'package:get/get.dart';
import 'package:getxtest/exp/exp_controllers.dart';

class UsersBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(UsersController());
  }
}