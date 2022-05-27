import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLayoutLogic {
 int scaffoldId = 0;
 final GlobalObjectKey<ScaffoldState> scaffoldKey = const GlobalObjectKey<ScaffoldState>('value');
 RxInt moduleId = 0.obs;


 RxInt test = 55.obs;

 void openDrawer(){
  scaffoldKey.currentState?.openDrawer();
 }
}