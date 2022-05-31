import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/core/router.dart';
import 'package:newbeefly/shared/constant/constants.dart';
import 'package:newbeefly/shared/constant/enums.dart';
import 'package:newbeefly/shared/helpers/helpers.dart';
import 'package:newbeefly/ui/layouts/main_layout_nested_logic.dart';

class MainLayoutNested extends GetResponsiveView<MainLayoutNestedLogic> {

  MainLayoutNested({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Scaffold(
      //appBar: _appBar(),
      drawer: _drawer(),
      body: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                _topBar(),
                _navigator(),
              ],
            ),
          ),
          if (screen.isDesktop) Expanded(child: _drawer()),
        ],
      ),
    );
  }

  // AppBar _appBar() {
  //   return AppBar(
  //     // leading: Obx(() {
  //     //   return Text('${logic.test}');
  //     // }),
  //     leading: Padding(
  //       padding: EdgeInsets.only(left: Helpers.getPadding(pad: 5)),
  //       child: Image.asset('assets/images/palo-it.png'),
  //     ),
  //     actions: [
  //       for (Modules module in Modules.values)
  //         ElevatedButton(
  //           child: Text('${Constants.moduleNames[module]!.name}'),
  //           onPressed: () {
  //             Get.toNamed(Constants.moduleNames[module]!.path);
  //             // logic.moduleId.value = Constants.moduleNames[module]!.id;
  //           },
  //         ),
  //     ],
  //   );
  // }

  Widget _topBar() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26, blurRadius: 5.0, offset: Offset(0.0, 0.75))
        ],
        color: Colors.white,
      ),
      padding: EdgeInsets.all(Helpers.getPadding(pad: 3)),
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          !screen.isDesktop
              ? Padding(
                  padding: EdgeInsets.only(left: Helpers.getPadding(pad: 3)),
                  child: Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu_outlined, size: 28.0),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.person_outline_rounded, size: 28.0),
              Padding(
                padding: EdgeInsets.only(left: Helpers.getPadding(pad: 3)),
                child: const Icon(Icons.settings_outlined, size: 28.0),
              ),
              const Padding(padding: EdgeInsets.only(right: 40.0)),
            ],
          ),
        ],
      ),
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        children: [
          Obx(() {
            return Text('${controller.test}');
          }),
          Padding(
            padding: EdgeInsets.all(Helpers.getPadding(pad: 10)),
            child: Image.asset('assets/images/palo-it.png'),
          ),
          for (Modules module in Modules.values)
            ListTile(
              title: Text(Constants.moduleNames[module]!.name),
              onTap: () {
                Get.offNamedUntil(Constants.moduleNames[module]!.path,
                    (route) => route.isFirst);
                //Get.toNamed(Constants.moduleNames[module]!.path);
                // logic.moduleId.value = Constants.moduleNames[module]!.id;
              },
            ),
        ],
      ),
    );
  }

  Widget _navigator() {
    return Flexible(
      child: Navigator(
        key: Get.nestedKey(1),
        reportsRouteUpdateToEngine: true,
        initialRoute: RouteConfig.userListingView,
        onGenerateRoute: (settings) => RouteConfig.generateRoute(settings),
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}
