import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_api_demo/app/core/mobx/common/common_store.dart';
import 'package:mock_api_demo/app/core/mobx/mobx.dart';
import 'package:mock_api_demo/utils/colors.dart';
import 'package:mock_api_demo/view/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import '../utils/app_constant.dart';
import 'app_config.dart';
import 'di_container.dart' as di;
import 'routes/paths.dart';
import 'routes/routes_genarator.dart';

Future<Widget> initializeApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init(appConfig.baseUrl);

  return EasyLocalization(
    supportedLocales: const [Locale('en')],
    fallbackLocale: const Locale('en'),
    path: 'assets/translations',
    child: MultiProvider(
      providers: [
        Provider<CommonStore>(create: (context) => di.sl<CommonStore>()),
        Provider<ProductDetailStore>(
            create: (context) => di.sl<ProductDetailStore>()),
        Provider<CartStore>(create: (context) => di.sl<CartStore>()),
      ],
      child: MyApp(appConfig),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppConfig appConfig;

  const MyApp(this.appConfig, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    MaterialApp materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mock Api Demo',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Paths.splashScreen,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: ColorPalettes.primaryColor,
        appBarTheme: const AppBarTheme(color: ColorPalettes.primaryColor),
        dialogTheme: DialogTheme(
            backgroundColor: ColorPalettes.gray900.withOpacity(0.8)),
        bottomSheetTheme: BottomSheetThemeData(
          modalBarrierColor: ColorPalettes.gray900.withOpacity(0.8),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );

    return ScreenUtilInit(
        designSize: const Size(360, 754),
        builder: (_, child) {
          return materialApp;
        });
  }
}
