import 'package:LaCoro/core/enums/payment_type.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/counter.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/payment_method.dart';
import 'package:flutter/material.dart';

/// This page should be use to test widgets
class TestPage extends StatelessWidget {
  static const TEST_PAGE_ROUTE = '/test_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Counter(quantity: 0,),
        ),
      ),
    );
  }
}
