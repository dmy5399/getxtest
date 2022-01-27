import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/env.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    _init();

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

  // Init clients
  _init() async {
    // Do not check http certificates
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    // await Hive.initFlutter();
    // Hive.registerAdapter(UserAdapter());
    // db = await Hive.openBox('db');
  }
}