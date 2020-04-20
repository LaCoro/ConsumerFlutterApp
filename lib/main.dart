import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'presentation/store_list/store_list_page.dart';

Future main() async {
  // TODO injected this
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  await DotEnv().load('${isProduction ? "production" : "development"}.env');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StoreListPage(),
    );
  }
}
