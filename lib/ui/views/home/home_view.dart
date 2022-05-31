import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphic/graphic.dart';
import 'package:newbeefly/core/router.dart';
import 'package:newbeefly/shared/constant/view_args.dart';
import 'package:newbeefly/shared/graphs/age.dart';
import 'package:newbeefly/shared/helpers/helpers.dart';
import 'package:newbeefly/ui/layouts/main_layout.dart';
import 'package:newbeefly/ui/layouts/main_layout_logic.dart';
import 'package:newbeefly/ui/views/home/home_logic.dart';

class HomeView extends GetResponsiveView<HomeLogic> {
  HomeView({Key? key}) : super(key: key);
  final List<Age> _data = [
    Age('Kent', 27),
    Age('Sam', 23),
    Age('Coco', 53),
    Age('Marry', 73),
    Age('Faiz', 13),
    Age('Ali', 43),
    Age('Henry', 65),
  ];

  @override
  Widget builder() {
    final MainLayoutLogic mainLayoutLogic = Get.find<MainLayoutLogic>();
    return MainLayout(
      child: Flexible(
        child: Center(
          child: ListView(
            controller: ScrollController(),
            children: [
              Container(
                height: 500.0,
                padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                child: Chart(
                  data: _data,
                  variables: {
                    'genre': Variable(
                      accessor: (Age age) => age.name,
                    ),
                    'sold': Variable(
                      accessor: (Age age) => age.age,
                    ),
                  },
                  elements: [IntervalElement()],
                  axes: [
                    Defaults.horizontalAxis,
                    Defaults.verticalAxis,
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                height: 500.0,
                child: BarChart(
                  BarChartData(
                    maxY: 100,
                    minY: 0,
                    barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (dbl, titleMeta)=>Text(dbl.toString()),

                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (dbl, titleMeta)=>Text(_data[dbl.toInt()].name),
                        ),
                      ),
                      leftTitles: AxisTitles(
                        axisNameWidget: const Text('Age'),
                        axisNameSize: 50.0,
                        sideTitles: SideTitles(
                          reservedSize: 28.0,
                          interval: 5,
                          showTitles: true,
                          getTitlesWidget: (dbl, titleMeta)=>Text(dbl.toString()),
                        ),
                      ),
                    ),
                    barGroups: _data
                        .asMap()
                        .entries
                        .map(
                          (entry) => BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                toY: entry.value.age.toDouble(),
                                width: 50.0,
                                fromY: 0.0,
                                color: screen.context.theme.primaryColor,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12.0)),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                  swapAnimationDuration: const Duration(milliseconds: 150),
                  swapAnimationCurve: Curves.linear,
                ),
              ),
              Helpers.customSwitch<ScreenType, Widget>(
                screen.screenType,
                {
                  ScreenType.Desktop: const Text('Desktop'),
                  ScreenType.Phone: const Text('Phone'),
                  ScreenType.Tablet: const Text('Tablet'),
                  ScreenType.Watch: const Text('Watch'),
                },
                const Text('What'),
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
                      value: Locale('en', 'US'),
                      child: Text('American English')),
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
                      controller.isDarkMode.value =
                          !controller.isDarkMode.value;
                      Get.changeThemeMode(controller.isDarkMode.value
                          ? ThemeMode.dark
                          : ThemeMode.light);
                    });
              }),
              ElevatedButton(
                child: Text("Go to Other".tr),
                onPressed: () => Get.toNamed(RouteConfig.secondView,
                    arguments: SecondViewArgs(), parameters: {'test': 'test'}),
              ),
              ElevatedButton(
                child: const Text("Head ++"),
                onPressed: () {
                  mainLayoutLogic.test++;
                },
              ),
              Builder(
                builder: (context) => ElevatedButton(
                  child: const Text("drawer"),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              FloatingActionButton(
                onPressed: controller.increment,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
