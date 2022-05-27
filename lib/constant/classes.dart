import 'package:flutter/material.dart';

class TabModules {
  final int id;
  final String name;
  final String path;
  final Widget widget;

  const TabModules({
    required this.id,
    required this.name,
    required this.path,
    required this.widget,
  });
}
