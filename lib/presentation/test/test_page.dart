import 'package:LaCoro/presentation/core/ui/custom_widgets/box_comments_order.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/cart_total_bottom.dart';
import 'package:flutter/material.dart';

/// This page should be use to test widgets
class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
            child: BottomAppBar(child: CartTotalBottom(11, "\$10.000"),),
        ),
      ),
    );
  }
}
