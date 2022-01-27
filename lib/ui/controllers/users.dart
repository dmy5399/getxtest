import 'dart:developer';
import 'package:get/get.dart';
import 'package:getxtest/models/user.dart';
import 'package:getxtest/services/repository.dart';

class UsersController extends GetxController{
  final List<User> records = <User>[];

  getUsers() async {
    var res = await UsersRepository.getAll();

    log(res.toString());
  }

}