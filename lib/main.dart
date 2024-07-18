import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:football_score/views/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:football_score/views/screens/home._menu.dart';
import 'package:get_storage/get_storage.dart';

import 'generated/codegen_loader.g.dart';

void main() async{
  await GetStorage.init();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale(
        'en',
      ),
      Locale("zh"),

    ],
    startLocale: const Locale('en'),
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    useFallbackTranslations: true,
    useOnlyLangCode: true,
    assetLoader: const CodegenLoader(),
    child: const MyApp(),
  ));
}
initialization()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Football Score',
      theme: ThemeData(
       useMaterial3: true
      ),
      localizationsDelegates:
      context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );

  }
}
