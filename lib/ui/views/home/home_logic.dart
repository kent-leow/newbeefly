import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newbeefly/shared/constant/constants.dart';

class HomeLogic extends GetxController {
  RxInt count = 0.obs;
  RxBool isDarkMode = false.obs;
  Rx<Locale> locale = Constants.defaultLocale.obs;

  increment() => count++;

  int factorial(int integer) {
    if (integer <= 1) {
      return 1;
    }
    return integer * factorial(--integer);
  }
}
