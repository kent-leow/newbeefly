import 'package:flutter/material.dart';
import 'package:newbeefly/core/router.dart';
import 'package:newbeefly/shared/constant/classes.dart';
import 'package:newbeefly/shared/constant/enums.dart';
import 'package:newbeefly/ui/views/home/home_view.dart';
import 'package:newbeefly/ui/views/profile/profile_view.dart';

class Constants {
  Constants._();

  static const Locale defaultLocale = Locale('en', 'US');
  static const List<String> availableLocales = ['en_US', 'en_MY'];
  static const double defaultPadding = 4.0;
  static Map<Modules, TabModules> moduleNames = {
    Modules.home: TabModules(
      id: 0,
      name: 'Home',
      path: RouteConfig.homeView,
      widget: HomeView(),
    ),
    Modules.profile: TabModules(
      id: 1,
      name: 'Profile',
      path: RouteConfig.profileView,
      widget: ProfileView(),
    ),
  };
}
