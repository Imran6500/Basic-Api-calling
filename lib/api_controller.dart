// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:api_getx/UserModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;

class ApiCalling extends GetxController {
  final String baseUrl = "https://api.github.com/users";
  RxList<UserModel> userList = RxList<UserModel>();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getApi();
  }

  void getApi() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      var data = jsonDecode(response.body);
      print(response.body);

      if (response.statusCode == 200) {
        isLoading.value = false;
        for (var user in data) {
          userList.add(UserModel.fromJson(user));
        }
      } else {
        isLoading.value = true;
        print("Something went wrong");
      }
    } catch (e) {
      isLoading.value = true;
      print(
        "error $e",
      );
    }
  }
}
