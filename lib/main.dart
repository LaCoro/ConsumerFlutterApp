import 'package:LaCoro/presentation/core/di/app_module.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(child: StoreListPage()),
    );
  }
}
