import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/constant/view_args.dart';
import 'package:newbeefly/core/helpers/helpers.dart';
import 'package:newbeefly/ui/layouts/main_layout_logic.dart';
import 'package:newbeefly/ui/layouts/main_layout_nested.dart';
import 'package:newbeefly/ui/views/common/error_view.dart';
import 'package:newbeefly/ui/views/common/not_found_view.dart';
import 'package:newbeefly/ui/views/home/home_logic.dart';
import 'package:newbeefly/ui/views/home/home_view.dart';
import 'package:newbeefly/ui/views/profile/profile_view.dart';
import 'package:newbeefly/ui/views/home/second_logic.dart';
import 'package:newbeefly/ui/views/home/second_view.dart';
import 'package:newbeefly/ui/views/user/user_detail_view.dart';
import 'package:newbeefly/ui/views/user/user_listing_view.dart';

class RouteConfig {
  static const Transition defaultTransition = Transition.noTransition;
  static const Duration defaultTransitionDuration = Duration(milliseconds: 0);

  static const String homeView = '/home';
  static const String secondView = '/home/second';
  static const String profileView = '/profile';
  static const String notFoundView = '/not-found';
  static const String errorView = '/error';
  static const String mainLayoutNested = '/main-layout-nested';
  static const String userListingView = '/user-listing';
  static const String userDetailView = '/user-detail';

  static String getDefaultView() => homeView;

  static final GetPage notFoundPage = GetPage(
    name: notFoundView,
    page: () => NotFoundView(),
  );

  static final List<GetPage> getPages = [
    GetPage(
      name: homeView,
      page: () => HomeView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => HomeLogic());
        },
      ),
      children: [
        GetPage(
          name: Helpers.removeTerm(secondView, term: homeView),
          page: () => SecondView(),
          binding: BindingsBuilder(
            () {
              Get.lazyPut(() => HomeLogic());
              Get.lazyPut(() => SecondLogic());
            },
          ),
        ),
      ],
    ),
    // GetPage(name: secondView, page: () => SecondView()),
    GetPage(name: profileView, page: () => ProfileView()),
    GetPage(name: errorView, page: () => ErrorView()),
    GetPage(name: mainLayoutNested, page: () => MainLayoutNested()),
  ];

  static Route<dynamic> generateRoute(RouteSettings settings) {
    PageRoute _getPageRoute(Widget child) {
      return GetPageRoute(
        transitionDuration: defaultTransitionDuration,
        page: () => child,
      );
    }

    switch (settings.name) {
      case RouteConfig.userListingView:
        return _getPageRoute(UserListingView());
      // case RouteConfig.secondView:
      //   final typedArgs = settings.arguments as SecondViewArgs;
      //   return _getPageRoute(SecondView(typedArgs));
      case RouteConfig.userDetailView:
        return _getPageRoute(UserDetailView());
      default:
        return _getPageRoute(UserListingView());
    }
  }
}
