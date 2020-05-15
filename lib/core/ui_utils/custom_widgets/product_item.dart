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
  final int quantity;
  final bool divider;

  const ProductItem(
      {Key key,
      @required this.itemUI,
      this.onQuantityChange,
      this.quantity,
      this.divider})
      : super(key: key);

  @override
  _ProductItemState createState() =>
      _ProductItemState(onQuantityChange, quantity ?? 0, divider ?? false);
}

class _ProductItemState extends State<ProductItem> {
  final bool divider;

  int quantity;
  bool animateQuantity = false;

  final Function(int) onQuantityChange;

  _ProductItemState(this.onQuantityChange, this.quantity, this.divider);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.itemUI.name ?? "",
                      style: AppTextStyle.boldBlack16),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(widget.itemUI.description ?? "",
                        style: AppTextStyle.grey13, maxLines: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("\$${widget.itemUI.price}",
                            style: AppTextStyle.black16),
                        Text("\$16.000", style: AppTextStyle.grey14overline),
                        DiscountChip(discountPercentage: "50"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child:
              Column(
                children: <Widget>[
                  widget.itemUI.image == null
                      ? SizedBox()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(
                              15.0, 15.0, 15.0, 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                                "https://www.liberaldictionary.com/wp-content/uploads/2018/11/pizza.jpg",
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill),
                          ),
                        ),
                  AnimatedOpacity(
                    opacity: animateQuantity ? 0.7 : 1,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.elasticInOut,
                    onEnd: () => setState(() => animateQuantity = false),
                    child: Counter(
                        quantity: quantity ?? 0,
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
            ),
          ],
        ),
        divider ? Divider(color: AppColors.divider) : SizedBox(),
      ],
    );
  }
}
