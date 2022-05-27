import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/constant/constants.dart';
import 'package:newbeefly/constant/enums.dart';
import 'package:newbeefly/core/router.dart';
import 'package:newbeefly/ui/layouts/main_layout_logic.dart';

class MainLayout extends StatelessWidget {
  final MainLayoutLogic logic = Get.find<MainLayoutLogic>();
  final Widget child;

  MainLayout({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _drawer(),
      body: Row(
        children: [
          Expanded(child: _drawer()),
          Expanded(
            flex: 5,
            child: child,
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: Obx(() {
        return Text('${logic.test}');
      }),
      actions: [
        for (Modules module in Modules.values)
          ElevatedButton(
            child: Text('${Constants.moduleNames[module]!.name}'),
            onPressed: () {
              Get.toNamed(Constants.moduleNames[module]!.path);
              // logic.moduleId.value = Constants.moduleNames[module]!.id;
            },
          ),
      ],
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        children: [
          Obx(() {
            return Text('${logic.test}');
          }),
          for (Modules module in Modules.values)
            ListTile(
              title: Text('${Constants.moduleNames[module]!.name}'),
              onTap: () {
                Get.toNamed(Constants.moduleNames[module]!.path);
                // logic.moduleId.value = Constants.moduleNames[module]!.id;
              },
            ),
        ],
      ),
    );
  }
}
