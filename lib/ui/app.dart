import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {

    // Создайте экземпляр вашего класса с помощью Get.put(), чтобы сделать его доступным для всех "дочерних" маршрутов.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Используйте Obx(()=> чтобы обновить Text() как только count изменится.
        appBar: AppBar(title: Obx(() => Text("Кликов: ${c.count}"))),

        // Замените 8 строк Navigator.push простым Get.to(). Вам не нужен context!
        body: Center(child: ElevatedButton(
            child: Text("Перейти к Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // "Попросите" Get найти и предоставить вам ваш Controller, используемый на другой странице.
  final Controller c = Get.find();

  @override
  Widget build(context){
    // Получите доступ к обновленной переменной count
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}