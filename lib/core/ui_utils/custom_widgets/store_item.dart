// @dart=2.9
import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/discount_chip.dart';
import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:flutter/material.dart';

class StoreItem extends StatelessWidget {
  String placeHolderAsset;
  StoreUI storeItem;

  StoreItem({Key key, this.storeItem, this.placeHolderAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Opacity(
            opacity: storeItem.isStoreClosed ? 0.4 : 1.0,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.assetNetwork(
                  placeholder: placeHolderAsset ?? 'assets/loading_resource.gif',
                  image: storeItem.logo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 2),
                    Text(
                      storeItem.name,
                      style: AppTextStyle.section,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(storeItem.tag, style: AppTextStyle.grey13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("${storeItem.openAt} - ${storeItem.closeAt}", style: AppTextStyle.black14),
                        SizedBox(width: 30.0),
                        Text("Envio ${storeItem.isDeliveryFree ? 'gratis' : '\$${storeItem.deliveryCost}'}",
                            style: AppTextStyle.black14.copyWith(color: storeItem.isDeliveryFree ? AppColors.indicatorColor : AppColors.boldTextColor)),
                      ],
                    ),
                    buildPromoWidget(),
                    buildStoreClosedIndicator(),
                    SizedBox(height: 3),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget buildPromoWidget() {
    return storeItem.hasAPromo
        ? Align(alignment: Alignment.topLeft, child: DiscountChip(discountPercentage: storeItem.discountPercentage))
        : SizedBox(height: 8.0);
  }

  Widget buildStoreClosedIndicator() {
    return storeItem.isStoreClosed ? Align(alignment: Alignment.centerLeft, child: Text("Cerrado", style: AppTextStyle.yellow13)) : SizedBox(height: 8.0);
  }
}
