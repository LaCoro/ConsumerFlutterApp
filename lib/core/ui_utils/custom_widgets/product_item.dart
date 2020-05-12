import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/counter.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/discount_chip.dart';
import 'package:LaCoro/core/ui_utils/model/item_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final ItemUI itemUI;
  final Function(int) onQuantityChange;

  const ProductItem({Key key, @required this.itemUI, this.onQuantityChange}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState(onQuantityChange);
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 0;

  bool animateQuantity = false;

  final Function(int) onQuantityChange;

  _ProductItemState(this.onQuantityChange);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left:24,top:16,right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.itemUI.name ?? "", style: AppTextStyle.boldBlack16),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(widget.itemUI.description ?? "", style: AppTextStyle.grey13, maxLines: 3),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("\$${widget.itemUI.price}", style: AppTextStyle.black16),
                          Text("\$16.000", style: AppTextStyle.grey14overline),
                          DiscountChip(discountPercentage: "50"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: widget.itemUI.image == null ? SizedBox() : Image.network("https://www.liberaldictionary.com/wp-content/uploads/2018/11/pizza.jpg", height: 100, width: 100, fit: BoxFit.fill),
                  ),
                ),
                AnimatedOpacity(
                  opacity: animateQuantity ? 0.7 : 1,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.elasticInOut,
                  onEnd: () => setState(() => animateQuantity = false),
                  child: Counter(
                      quantity: quantity,
                      onQuantityChange: (value) {
                        setState(() {
                          quantity = value;
                          animateQuantity = true;
                        });
                        onQuantityChange.call(value);
                      }),
                ),
              ],
            ),
          ],
        ),
        Divider(color: AppColors.divider),
      ],
    );
  }
}
