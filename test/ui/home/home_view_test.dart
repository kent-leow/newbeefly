import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:newbeefly/ui/layouts/main_layout_logic.dart';
import 'package:newbeefly/ui/views/home/home_logic.dart';
import 'package:newbeefly/ui/views/home/home_view.dart';

void main() {
  testWidgets('Widget has LOL', (widgetTester) async {
    Get.put(MainLayoutLogic());
    Get.put(HomeLogic());
    await widgetTester.pumpWidget(
      GetMaterialApp(home: HomeView()),
    );
    final findLOL = find.text('LOL');
    final findDrawer = find.text('drawer');

    expect(findLOL, findsOneWidget);
    expect(findDrawer, findsOneWidget);
  });
}
