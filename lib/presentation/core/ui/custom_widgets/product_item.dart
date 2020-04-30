import 'package:LaCoro/presentation/core/ui/custom_widgets/counter.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/discount_chip.dart';
import 'package:domain/entities/item_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final ItemEntity itemEntity;

  const ProductItem({Key key, @required this.itemEntity}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.itemEntity.name ?? "", style: Theme.of(context).textTheme.headline5),
                    Text(widget.itemEntity.description ?? "", style: Theme.of(context).textTheme.caption),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("\$${widget.itemEntity.price}", style: Theme.of(context).textTheme.headline5),
                          Text("\$16.000", style: Theme.of(context).textTheme.overline),
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
                    child: Image.network("https://www.liberaldictionary.com/wp-content/uploads/2018/11/pizza.jpg", height: 100, width: 100, fit: BoxFit.fill),
                  ),
                ),
                Counter(quantity: quantity, onQuantityChange: (value) => setState(() => quantity = value)),
              ],
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}
