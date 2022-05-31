import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/ui/layouts/main_layout.dart';

import 'profile_logic.dart';

class ProfileView extends GetResponsiveView<ProfileLogic> {
  ProfileView({Key? key}) : super(key: key);


  @override
  Widget builder() {
    return MainLayout(child: const Text('PROFILE'));
  }
}
