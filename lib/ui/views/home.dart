import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: (){

              // Navigate to UsersView
              Get.toNamed('/users');
            },
            child: const Text('Go to users'),
          ),
        )
    );
  }
}