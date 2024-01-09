import 'package:api_getx/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  ApiCalling controller = Get.put(ApiCalling());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange.shade300,
          centerTitle: true,
          title: const Text("Api Calling"),
        ),
        body: ListView(children: [
          Obx(
            () => controller.isLoading.value
                ? const LinearProgressIndicator()
                : Column(
                    children: controller.userList
                        .map(
                          (e) => Container(
                            height: 70,
                            width: 400,
                            color: Colors.orange.shade100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(e.avatarUrl.toString()),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  e.login.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList()),
          ),
          const Divider()
        ]));
  }
}
