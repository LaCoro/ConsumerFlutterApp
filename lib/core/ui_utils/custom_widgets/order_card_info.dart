import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/extensions/number_extensions.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderCardInfo extends StatelessWidget {
  final OrderEntity orderEntity;

  const OrderCardInfo({Key key, this.orderEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 4.0,
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 96,
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
                    image: orderEntity?.storeEntity?.logo ?? '',
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
                    Text(orderEntity.storeEntity?.name ?? '', style: AppTextStyle.section, maxLines: 2, overflow: TextOverflow.ellipsis),
                    Text(DateFormat('dd/MM/yyyy  -  HH:mm').format(orderEntity.createdAt?.toLocal())),
                    Text('Pago en efectivo', style: AppTextStyle.boldBlack16),
                    Text(orderEntity.totalAmount?.currencyFormat() ?? '******', style: AppTextStyle.section),
                  ],
                ),
              ),
            ),
            Icon(Icons.chevron_right, size: 40, color: AppColors.yellowAction),
          ],
        ),
      ),
    );
  }
}
