import 'package:LaCoro/core/di/app_module.dart';
import 'package:LaCoro/core/localization/app_localizations_delegate.dart';
import 'package:LaCoro/presentation/adresses/addresses_page_new.dart';
import 'package:LaCoro/presentation/adresses/my_address_page.dart';
import 'package:LaCoro/presentation/order_detail/order_detail_page.dart';
import 'package:LaCoro/presentation/register/register_page.dart';
import 'package:LaCoro/presentation/splash/splash.dart';
import 'package:LaCoro/presentation/store_details/store_details_page.dart';
import 'package:LaCoro/presentation/test/styles_test_page.dart';
import 'package:LaCoro/presentation/test/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/appearance/app_theme.dart';
import 'presentation/adresses/select_address_map_page.dart';
import 'presentation/store_list/store_list_page.dart';

Future main() async {
  // Inject modules
  await AppModule().initialise(Injector.getInjector());

  // start app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.resize(800, name: TABLET),
//            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
      ),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      debugShowCheckedModeBanner: false,
      title: 'LaCoro',
      theme: AppTheme.build(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget destinationRoute = SplashPage();
        switch (settings.name) {
          case StoreDetailsPage.STORE_DETAILS_ROUTE:
            destinationRoute = StoreDetailsPage();
            break;
          case OrderDetailPage.ORDER_DETAIL_ROUTE:
            destinationRoute = OrderDetailPage();
            break;
        }
        return MaterialPageRoute(builder: (context) => destinationRoute, settings: settings);
      },
      routes: {
        '/': (BuildContext context) => RegisterPage(),
        StoreListPage.STORE_LIST_ROUTE: (BuildContext context) => StoreListPage(),
        SelectAddressMapPage.SELECT_ADDRESS_MAP_ROUTE: (BuildContext context) => SelectAddressMapPage(),
        StylesTestPage.STYLE_TEST_PAGE_ROUTE: (BuildContext context) => StylesTestPage(),
        AddressesPage.ADDRESSES_LIST_ROUTE: (BuildContext context) => AddressesPage(),
        SplashPage.SPLASH_PAGE_ROUTE: (BuildContext context) => SplashPage(),
        RegisterPage.REGISTER_ROUTE: (BuildContext context) => RegisterPage(),
        MyAddressPage.MY_ADDRESS_ROUTE: (BuildContext context) => MyAddressPage(),
        TestPage.TEST_PAGE_ROUTE: (BuildContext context) => TestPage()
      },
    );
  }
}
