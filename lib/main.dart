import 'package:LaCoro/core/di/app_module.dart';
import 'package:LaCoro/core/localization/app_localizations_delegate.dart';
import 'package:LaCoro/presentation/adresses/addresses_page_new.dart';
import 'package:LaCoro/presentation/adresses/my_address_page.dart';
import 'package:LaCoro/presentation/checkout/checkout_page.dart';
import 'package:LaCoro/presentation/order_detail/order_detail_page.dart';
import 'package:LaCoro/presentation/order_history/order_history_page.dart';
import 'package:LaCoro/presentation/order_status/order_status_page.dart';
import 'package:LaCoro/presentation/past_order_detail/past_order_detail_page.dart';
import 'package:LaCoro/presentation/register/pin_page.dart';
import 'package:LaCoro/presentation/register/register_page.dart';
import 'package:LaCoro/presentation/splash/splash.dart';
import 'package:LaCoro/presentation/store_details/store_details_page.dart';
import 'package:LaCoro/presentation/test/styles_test_page.dart';
import 'package:LaCoro/presentation/test/test_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/appearance/app_theme.dart';
import 'core/env/envirionment_configuration.dart';
import 'presentation/adresses/select_address_map_page.dart';
import 'presentation/store_list/store_list_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); //all widgets are rendered here
  await EnvironmentConfiguration.run(); // Init env configuration
  await AppModule.initialise(Injector()); // Inject modules
  await Firebase.initializeApp(); // Init Firebase

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: MaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 480, name: MOBILE),
            const Breakpoint(start: 481, end: 800, name: TABLET),
            // const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            // const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
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
        onGenerateRoute: (settings) {
          Widget destinationRoute = SplashPage();
          switch (settings.name) {
            case StoreDetailsPage.STORE_DETAILS_ROUTE:
              destinationRoute = StoreDetailsPage();
              break;
            case OrderDetailPage.ORDER_DETAIL_ROUTE:
              destinationRoute = OrderDetailPage();
              break;
            case CheckoutPage.CHECKOUT_ORDER_ROUTE:
              destinationRoute = CheckoutPage();
              break;
            case OrderStatusPage.ORDER_STATUS_ROUTE:
              destinationRoute = OrderStatusPage();
              break;
            case MyAddressPage.MY_ADDRESS_ROUTE:
              destinationRoute = MyAddressPage();
              break;
            case PastOrderDetailPage.PAST_ORDER_DETAIL_ROUTE:
              destinationRoute = PastOrderDetailPage();
              break;
          }
          return MaterialPageRoute(builder: (context) => destinationRoute, settings: settings);
        },
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => SplashPage(),
          StoreListPage.STORE_LIST_ROUTE: (BuildContext context) => StoreListPage(),
          SelectAddressMapPage.SELECT_ADDRESS_MAP_ROUTE: (BuildContext context) => SelectAddressMapPage(),
          StylesTestPage.STYLE_TEST_PAGE_ROUTE: (BuildContext context) => StylesTestPage(),
          AddressesPage.ADDRESSES_LIST_ROUTE: (BuildContext context) => AddressesPage(),
          SplashPage.SPLASH_PAGE_ROUTE: (BuildContext context) => SplashPage(),
          RegisterPage.REGISTER_ROUTE: (BuildContext context) => RegisterPage(),
          PinPage.PIN_REGISTER_ROUTE: (BuildContext context) => PinPage(),
          OrderHistoryPage.ORDER_HISTORY_ROUTE: (BuildContext context) => OrderHistoryPage(),
          TestPage.TEST_PAGE_ROUTE: (BuildContext context) => TestPage()
        },
      ),
    );
  }
}
