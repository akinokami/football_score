import 'package:flutter/material.dart';
import 'package:football_score/language/languages.dart';
import 'package:football_score/views/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  // runApp(EasyLocalization(
  //   supportedLocales: const [
  //     Locale(
  //       'en',
  //     ),
  //     Locale("zh"),
  //   ],
  //   startLocale: const Locale('en'),
  //   path: 'assets/translations',
  //   fallbackLocale: const Locale('en'),
  //   useFallbackTranslations: true,
  //   useOnlyLangCode: true,
  //   assetLoader: const CodegenLoader(),
  //   child: const MyApp(),
  // ));

  runApp(const MyApp());
}

// initialization() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String language = box.read('language') ?? "en";
    return GetMaterialApp(
      title: 'Football Score',
      theme: ThemeData(useMaterial3: true),
      translations: Languages(),
      locale: language == 'zh'
          ? const Locale('zh', 'CN')
          : const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
