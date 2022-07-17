import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:uu_app/theme.dart';
import 'common/app_router/index.dart';
import 'common/i18n/index.dart';
import 'common/store/index.dart';
import 'common/widgets/index.dart';
import 'global.dart';

void main() {
  Global.init().then((value) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) => RefreshConfiguration(
              headerBuilder: () => const ClassicHeader(
                refreshingIcon: CupertinoActivityIndicator(),
              ),
              footerBuilder: () => const ClassicFooter(
                loadingIcon: CupertinoActivityIndicator(),
              ),
              hideFooterWhenNotFull: true,
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter UU',
                theme: AppTheme.light(),
                darkTheme: AppTheme.dark(),
                themeMode: AppTheme.mode,
                popGesture: true,
                transitionDuration: const Duration(milliseconds: 450),
                customTransition: RouteTransition(),
                initialRoute: RouterName.Launch,
                getPages: Routers.getPages,
                navigatorObservers: [Routers.observer],
                builder: EasyLoading.init(builder: (context, child) {
                  EasyLoading.instance
                    ..displayDuration = const Duration(milliseconds: 2000)
                    ..indicatorType = EasyLoadingIndicatorType.ring
                    ..loadingStyle = EasyLoadingStyle.custom
                    ..radius = 20.w
                    ..boxShadow = [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.15),
                        offset: const Offset(0, 0),
                        blurRadius: 20.w,
                      ),
                    ]
                    ..progressColor = Colors.transparent
                    ..contentPadding = EdgeInsets.all(20.w)
                    ..backgroundColor =
                        Theme.of(context).brightness == Brightness.light
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.tertiary
                    ..indicatorColor = Colors.transparent
                    ..textColor = Theme.of(context).colorScheme.onSurface
                    ..textStyle = TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.w,
                      color: Theme.of(context).colorScheme.onSurface,
                    )
                    ..maskType = EasyLoadingMaskType.clear
                    ..maskColor = const Color(0xFF09101D).withOpacity(0.7)
                    ..userInteractions = true
                    ..successWidget = const CustomToastSuccess()
                    ..errorWidget = const CustomToastFail()
                    ..indicatorWidget = CustomLoadingIndicator(size: 60.w)
                    ..dismissOnTap = false;
                  return ScrollConfiguration(
                    behavior: NoShadowScrollBehavior(),
                    child: child ?? const Material(),
                  );
                }),
                localizationsDelegates: const [
                  // RefreshLocalizations.delegate,
                  // GlobalMaterialLocalizations.delegate,
                  // GlobalWidgetsLocalizations.delegate,
                  // GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: Translation.supported,
                fallbackLocale: Translation.fallback,
                locale: ConfigStore.to.locale,
                translations: Translation(),
              ),
            ));
  }
}

class NoShadowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return child;
      case TargetPlatform.android:
        return GlowingOverscrollIndicator(
          showLeading: false,
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).colorScheme.primary,
          child: child,
        );
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return GlowingOverscrollIndicator(
          showLeading: false,
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).colorScheme.primary,
          child: child,
        );
    }
  }
}

void testRegister() {
  // UULoginDao.register("faker_uzi", "18356087041", "10545853", "1587");
}

void testLogin() {
  // UULoginDao.login("faker_uzi", "18356087041");
}
