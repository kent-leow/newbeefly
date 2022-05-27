import 'package:get/get.dart';
import 'package:newbeefly/constant/constants.dart';
import 'package:flutter/material.dart';

class Helpers {
  Helpers._();

  static Function getPadding =
      ({int pad = 1}) => pad * Constants.defaultPadding;

  static Case customSwitch<CaseType, Case>(
    CaseType selectedCase,
    Map<CaseType, Case> cases,
    Case defaultCase,
  ) =>
      cases[selectedCase] ?? defaultCase;

  static String Function(String, {String term}) removeTerm =
      (String word, {String term = ''}) => word.replaceFirst(term, '');
}
