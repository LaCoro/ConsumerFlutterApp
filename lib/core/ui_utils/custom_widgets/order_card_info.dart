import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/extensions/number_extensions.dart';
import 'package:LaCoro/presentation/order_detail/order_detail_page.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderCardInfo extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderCardInfo({Key key, this.orderEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loading_resource.gif',
                  image: orderEntity.store.logo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(orderEntity.store.name, style: AppTextStyle.section, maxLines: 2, overflow: TextOverflow.ellipsis),
                  Text(DateFormat('dd/MM/yyyy  -  HH:mm').format(orderEntity.createdAt?.toLocal())),
                  Text('Pago en efectivo', style: AppTextStyle.boldBlack16),
                  Text(orderEntity.totalAmount?.currencyFormat() ?? '******', style: AppTextStyle.section),
                ],
              ),
            ),
          ),
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, OrderDetailPage.ORDER_DETAIL_ROUTE, arguments: orderEntity);
              },
              child: Text('Ver detalle', style: AppTextStyle.yellow16)),
        ],
      ),
    );
  }
}
