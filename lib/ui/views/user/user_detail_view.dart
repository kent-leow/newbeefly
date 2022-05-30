import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_detail_logic.dart';

class UserDetailView extends StatelessWidget {
  final logic = Get.put(UserDetailLogic());

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.back(id: 1);
      },
      child: Text("Back"),
    );
  }
}
