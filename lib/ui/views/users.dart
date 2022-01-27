import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/ui/controllers/users.dart';

class UsersView extends StatelessWidget {
  UsersView({Key? key}) : super(key: key);

  final usersCr = Get.find<UsersController>();

  @override
  Widget build(context) {

    usersCr.getUsers();

    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: Center(
        child: Obx( () => Text(usersCr.records.toString())),
      ),
    );
  }
}
