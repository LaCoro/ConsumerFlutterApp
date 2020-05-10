import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/counter.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/discount_chip.dart';
import 'package:domain/entities/item_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final ItemEntity itemEntity;
  final Function(int) onQuantityChange;

  const ProductItem({Key key, @required this.itemEntity, this.onQuantityChange})
      : super(key: key);

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
                    Text(widget.itemEntity.name ?? "",
                        style: AppTextStyle.boldBlack16),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(widget.itemEntity.description ?? "",
                          style: AppTextStyle.grey13),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("\$${widget.itemEntity.price}",
                              style: AppTextStyle.black16),
                          Text("\$16.000",
                              style: AppTextStyle.grey16overline),
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
