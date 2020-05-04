import 'package:LaCoro/presentation/core/ui/custom_widgets/box_comments_order.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/cart_total_bottom.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/category_tabs.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/teper_bar.dart';
import 'package:flutter/material.dart';

/// This page should be use to test widgets
class TestPage extends StatelessWidget {
  static const TEST_PAGE_ROUTE = '/test_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Spacer(),
              Expanded(child: CategoryTabs(List.generate(15, (index) => "Category $index"), (i, s) {})),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
