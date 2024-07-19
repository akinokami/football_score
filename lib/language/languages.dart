import 'package:football_score/language/vi_language.dart';
import 'package:football_score/language/zh_language.dart';
import 'package:football_score/language/en_language.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': ZhLanguage().zhLanguage,
        'en_US': EnLanguage().enLanguage,
        'vi_VN': ViLanguage().viLanguage,
      };
}
