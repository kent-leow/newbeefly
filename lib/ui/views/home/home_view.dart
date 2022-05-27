import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/constant/view_args.dart';
import 'package:newbeefly/core/helpers/helpers.dart';
import 'package:newbeefly/core/router.dart';
import 'package:newbeefly/ui/layouts/main_layout.dart';
import 'package:newbeefly/ui/layouts/main_layout_logic.dart';
import 'package:newbeefly/ui/views/home/home_logic.dart';

class HomeView extends GetResponsiveView<HomeLogic> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget builder() {
    final MainLayoutLogic mainLayoutLogic = Get.find<MainLayoutLogic>();

    return MainLayout(
      child: Flexible(
        child: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  Helpers.customSwitch<ScreenType, Widget>(
                    screen.screenType,
                    {
                      ScreenType.Desktop: Text('Desktop'),
                      ScreenType.Phone: Text('Phone'),
                      ScreenType.Tablet: Text('Tablet'),
                      ScreenType.Watch: Text('Watch'),
                    },
                    Text('What'),
                  ),
                  Obx(() => Text("Clicks: ${controller.count}")),
                  ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Test',
                      );
                    },
                    child: const Text('LOL'),
                  ),
                  DropdownButton(
                    value: controller.locale.value,
                    items: const [
                      //R: Temp, make it dynamic later
                      DropdownMenuItem(
                          value: Locale('en', 'US'), child: Text('American English')),
                      DropdownMenuItem(
                          value: Locale('en', 'MY'),
                          child: Text('Malaysian English')),
                    ],
                    onChanged: (Locale? value) {
                      controller.locale.value = value!;
                      Get.updateLocale(value);
                    },
                  ),
                  Obx(() {
                    return Switch(
                        value: controller.isDarkMode.value,
                        onChanged: (bool bool) {
                          controller.isDarkMode.value = !controller.isDarkMode.value;
                          Get.changeThemeMode(controller.isDarkMode.value
                              ? ThemeMode.dark
                              : ThemeMode.light);
                        });
                  }),
                  ElevatedButton(
                    child: Text("Go to Other".tr),
                    onPressed: () => Get.toNamed(
                        RouteConfig.secondView,
                        arguments: SecondViewArgs(),
                        parameters: {
                          'test': 'test'
                        }
                    ),
                  ),
                  ElevatedButton(
                    child: Text("Head ++"),
                    onPressed: () {
                      mainLayoutLogic.test++;
                    },
                  ),
                  Builder(
                    builder: (context) => ElevatedButton(
                      child: Text("drawer"),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: controller.increment,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}
