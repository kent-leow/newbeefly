import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserListingLogic extends GetxController {


  Future<List<Map<String, dynamic>>> getData() async {
    return [
      {
        "name": "Kent Leow",
        "age": 27,
        "origin": "Malaysian",
        "gender": "Male"
      },
      {
        "name": "Chris Wu",
        "age": 33,
        "origin": "China",
        "gender": "Male"
      },
      {
        "name": "Mandy Lee",
        "age": 25,
        "origin": "Singapore",
        "gender": "Female"
      }
    ];
  }
}
