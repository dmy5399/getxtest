import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:get/get.dart';
import 'package:getxtest/env.dart';
import 'package:getxtest/exp/exp_models.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController extends GetxController{

  _init() async {
    // Do not check http certificates
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    // Init hive database
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    db = await Hive.openBox('db');
    
  }

  @override
  void onInit(){
    _init();

    super.onInit;
  }
}