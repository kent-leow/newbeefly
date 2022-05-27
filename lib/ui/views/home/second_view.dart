import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/constant/view_args.dart';
import 'package:newbeefly/ui/layouts/main_layout.dart';
import 'package:newbeefly/ui/views/home/home_logic.dart';

import 'second_logic.dart';

class SecondView extends GetResponsiveView<SecondLogic> {
  final HomeLogic homeLogic = Get.find();
  final SecondViewArgs _args = Get.arguments as SecondViewArgs;
  final Map _params = Get.parameters;

  SecondView({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return MainLayout(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${homeLogic.count}"),
            Builder(
              builder: (context) => ElevatedButton(
                child: Text('drawer'),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            ElevatedButton(
              onPressed: Get.back,
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
