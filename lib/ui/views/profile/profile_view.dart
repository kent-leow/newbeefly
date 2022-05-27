import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/constant/view_args.dart';
import 'package:newbeefly/ui/layouts/main_layout.dart';

import 'profile_logic.dart';

class ProfileView extends GetResponsiveView<ProfileLogic> {

  @override
  Widget builder() {
    return MainLayout(child: Text('PROFILE'));
  }
}
