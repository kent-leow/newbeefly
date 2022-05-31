import 'package:newbeefly/shared/constant/constants.dart';

class Helpers {
  Helpers._();

  static double Function({int pad}) getPadding =
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
