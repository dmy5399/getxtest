import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/ui/controllers/users.dart';

class UsersView extends StatelessWidget {
  UsersView({Key? key}) : super(key: key);

  final usersCr = Get.find<UsersController>();

  @override
  Widget build(context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: Obx((){
        if(usersCr.loading()){
          return const Center(child: CircularProgressIndicator(),);
        } else {
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
      })
    );
  }
}
