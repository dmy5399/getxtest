import 'dart:developer';
import 'package:get/get.dart';
import 'package:getxtest/models/user.dart';
import 'package:getxtest/services/repository.dart';
import 'package:getxtest/utils/states.dart';

class UsersController extends GetxController{
  final List<User> records = <User>[].obs;
  Rx<UsersState> state = UsersState.success.obs;
  RxString errorDesc = "".obs;

  _getUsers() async {
    state(UsersState.loading);

    try{
      // Get users from repository
      var users = await UsersRepository.getAll();

      // Add users to obs variable
      for(var user in users){
        records.add(user);
      }

      state(UsersState.success);

    } catch(e) {
      state(UsersState.error);
      errorDesc("No connection");
    }

  }

  @override
  void onInit(){
    _getUsers();
    super.onInit;
  }

}