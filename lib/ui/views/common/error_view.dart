import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbeefly/constant/view_args.dart';

class ErrorView extends StatelessWidget{
  final ErrorViewArgs _args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Text('Im ERROR');
  }


}