import 'package:LaCoro/presentation/core/ui/custom_widgets/CartTotalBottom.dart';
import 'package:flutter/material.dart';

/// This page should be use to test widgets
class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
            child: BottomAppBar(child: CartTotalBottom("0", "123123"))),
      ),
    );
  }
}
