import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/ui/controllers/users.dart';
import 'package:getxtest/utils/states.dart';

class UsersView extends StatelessWidget {
  UsersView({Key? key}) : super(key: key);

  final usersCr = Get.find<UsersController>();

  @override
  Widget build(context) {

    Widget _body(){
      return SingleChildScrollView(
        child: Column(
          children: [
            for(var el in usersCr.records)
              SizedBox(
                width: Get.width,
                height: 50,
                child: Text(el.email.toString()),
              ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: Obx(() {
        switch(usersCr.state()){
          case UsersState.loading:
            return const Center(child: CircularProgressIndicator(),);
          case UsersState.error:
            return Center(child: Text(usersCr.errorDesc()),);
          case UsersState.success:
            return _body();
          default:
            return const Center(child: Text("Unknown Error"),);
        }
      })
    );
  }
}
