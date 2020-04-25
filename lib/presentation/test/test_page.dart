import 'package:LaCoro/presentation/core/ui/custom_widgets/cart_total_bottom.dart';
import 'package:LaCoro/presentation/product_item/product_item.dart';
import 'package:flutter/material.dart';

/// This page should be use to test widgets
class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ProductItem(),
            Align(
                alignment: Alignment.bottomCenter,
                child: BottomAppBar(child: CartTotalBottom("0", "123123"))),
          ],
        )
      ),
    );
  }
}
