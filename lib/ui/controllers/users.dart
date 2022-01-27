import 'dart:developer';
import 'package:get/get.dart';
import 'package:getxtest/models/user.dart';
import 'package:getxtest/services/repository.dart';

class UsersController extends GetxController{
  final List<User> records = <User>[].obs;
  RxBool loading = false.obs;

  _getUsers() async {
    loading(true);

    // Get users from repository
    List<User> users = await UsersRepository.getAll();

    loading(false);

    // Add users to obs variable
    for(var user in users){
      records.add(user);
    }

  }

  @override
  void onInit(){
    _getUsers();
    super.onInit;
  }

}