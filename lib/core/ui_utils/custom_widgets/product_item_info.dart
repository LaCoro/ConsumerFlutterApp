// @dart=2.9
import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/counter_touch.dart';
import 'package:LaCoro/core/ui_utils/model/item_ui.dart';
import 'package:flutter/material.dart';

class ProductItemInfo extends StatefulWidget {
  final ItemUI itemUI;
  final int quantity;

  ProductItemInfo({Key key, @required this.itemUI, this.quantity});

  @override
  _ProductItemInfoState createState() => _ProductItemInfoState();
}

class _ProductItemInfoState extends State<ProductItemInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 16, top: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.itemUI.name.trim() ?? "", style: AppTextStyle.boldBlack16),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(widget.itemUI.description.trim() ?? "", style: AppTextStyle.grey13, maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                          child: Text("\$${widget.itemUI.price}", style: AppTextStyle.boldBlack16),
                        )
                      ],
                    ),
                  ),
                ),
                Center(child: Text('x${widget.quantity}', style: AppTextStyle.accent18)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
