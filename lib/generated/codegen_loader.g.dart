// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> zh = {
  "kLeagueChoice": "你对什么联赛感兴趣？",
  "kYouCanChooseMultiple": "您可以选择多个您可以选择多个",
  "kNext": "下一个"
};
static const Map<String,dynamic> en = {
  "kLeagueChoice": "What league do you interested ?",
  "kYouCanChooseMultiple": "You can choose more than one",
  "kNext": "Next"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"zh": zh, "en": en};
}
