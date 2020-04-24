import 'package:LaCoro/presentation/core/ui/app_theme.dart';
import 'package:LaCoro/presentation/test/test_page.dart';
import 'package:LaCoro/presentation/core/di/app_module.dart';
import 'package:LaCoro/presentation/store_details/store_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'presentation/store_list/store_list_page.dart';

Future main() async {
  await AppModule().initialise(Injector.getInjector());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.build(),
      initialRoute: INITIAL_ROUTE,
      routes: {
        INITIAL_ROUTE: (BuildContext context) => TestPage(), // TODO change
        STORE_LIST_ROUTE: (BuildContext context) => StoreListPage(),
        STORE_DETAILS_ROUTE: (BuildContext context) => StoreDetailsPage(),
      },
    );
  }
}

// Route names
const INITIAL_ROUTE = '/';
const STORE_LIST_ROUTE = '/store_list';
const STORE_DETAILS_ROUTE = '/store_details';
