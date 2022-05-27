import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/constant/view_args.dart';
import 'package:newbeefly/core/helpers/helpers.dart';
import 'package:newbeefly/ui/views/common/error_view.dart';
import 'package:newbeefly/ui/views/common/not_found_view.dart';
import 'package:newbeefly/ui/views/home/home_logic.dart';
import 'package:newbeefly/ui/views/home/home_view.dart';
import 'package:newbeefly/ui/views/profile/profile_view.dart';
import 'package:newbeefly/ui/views/home/second_logic.dart';
import 'package:newbeefly/ui/views/home/second_view.dart';

class RouteConfig {
  static const Transition defaultTransition = Transition.noTransition;
  static const Duration defaultTransitionDuration = Duration(milliseconds: 0);

  static const String homeView = '/home';
  static const String secondView = '/home/second';
  static const String profileView = '/profile';
  static const String notFoundView = '/not-found';
  static const String errorView = '/error';

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
  ];

// static Route<dynamic> generateRoute(RouteSettings settings) {
//   PageRoute _getPageRoute(Widget child) {
//     return PageRouteBuilder(
//       transitionDuration: defaultTransitionDuration,
//       reverseTransitionDuration: defaultTransitionDuration,
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return child;
//       },
//     );
//   }
//   print(settings.name);
//   switch (settings.name) {
//     case RouteConfig.homeView:
//       return _getPageRoute(HomeView());
//     case RouteConfig.secondView:
//       final typedArgs = settings.arguments as SecondViewArgs;
//       return _getPageRoute(SecondView(typedArgs));
//     case RouteConfig.profileView:
//       return _getPageRoute(ProfileView());
//     default:
//       return _getPageRoute(HomeView());
//   }
// }
}
