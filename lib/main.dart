import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_score/language/languages.dart';
import 'package:football_score/views/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/global.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  await FastCachedImageConfig.init(
    clearCacheAfter: const Duration(days: 3),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    Global.language = box.read('language') ?? "vi";
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Football Score',
          theme: ThemeData(useMaterial3: true),
          translations: Languages(),
          locale: Global.language == 'zh'
              ? const Locale('zh', 'CN')
              : Global.language == 'vi'
                  ? const Locale('vi', 'VN')
                  : const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
