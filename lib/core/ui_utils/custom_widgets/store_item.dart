import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/discount_chip.dart';
import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreItem extends StatelessWidget {
  String placeHolderAsset;
  StoreUI storeItem;

  StoreItem({Key key, this.storeItem, this.placeHolderAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deliveryCostColor = storeItem.isDeliveryFree ? AppColors.accentColor : AppColors.boldTextColor;

    var deliveryServiceMsg = storeItem.isDeliveryFree ? "gratis" : "\$${storeItem.deliveryCost}";

    var promoWidget = storeItem.hasAPromo
        ? Align(alignment: Alignment.topLeft, child: DiscountChip(discountPercentage: storeItem.discountPercentage))
        : SizedBox(height: 8.0);

    var storeClosedWidget = storeItem.isStoreClosed
        ? Align(
            alignment: Alignment.centerLeft,
            child: Text("Cerrado", style: AppTextStyle.yellow13),
          )
        : SizedBox(height: 8.0);

    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.assetNetwork(
                  placeholder: placeHolderAsset ?? 'assets/loading_resource.gif',
                  image: storeItem.logo,
                  fit: BoxFit.fill,
                ),
              )),
          Expanded(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      storeItem.name,
                      style: AppTextStyle.boldBlack16,
                    ),
                    Text(storeItem.tag, style: AppTextStyle.grey13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("${storeItem.openAt} - ${storeItem.closeAt}", style: AppTextStyle.black14),
                        SizedBox(width: 16.0),
                        Text("Envio $deliveryServiceMsg", style: AppTextStyle.black14.copyWith(color: deliveryCostColor)),
                      ],
                    ),
                    promoWidget,
                    storeClosedWidget,
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
