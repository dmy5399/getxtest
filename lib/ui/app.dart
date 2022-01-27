import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/exp/exp_bindings.dart';
import 'package:getxtest/exp/exp_views.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GetMaterialApp widget is extended analog of MaterialApp widget
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      // Initializing routes
      getPages: [
        GetPage(name: "/home", page: () => HomeView(), binding: HomeBinding()),
        GetPage(name: "/users", page: () => UsersView(), binding: UsersBinding()),
      ],
    );
  }
}


