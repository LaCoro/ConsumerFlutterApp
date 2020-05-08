import 'package:LaCoro/presentation/core/ui/model/store_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/discount_chip.dart';
import '../app_colors.dart';


class StoreItem  extends StatelessWidget{

  String placeHolderAsset;
  StoreUI storeItem;


  StoreItem({Key key,
    this.storeItem,
    this.placeHolderAsset
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var deliveryCostColor = storeItem.isDeliveryFree ? AppColors.accentColor : AppColors.boldTextColor;

    var deliverFontWeight = storeItem.isDeliveryFree ? FontWeight.bold : FontWeight.normal;

    var deliveryServiceMsg = storeItem.isDeliveryFree ? "gratis" : "\$${storeItem.deliveryCost}";

    var promoWidget = storeItem.hasAPromo?    Align(
        alignment: Alignment.topLeft,
        child: DiscountChip(discountPercentage: storeItem.discountPercentage)): SizedBox(height : 10.0);

    var storeClosedWidget = storeItem.isStoreClosed? Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Cerrado",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: AppColors.yellowAction),
          textAlign: TextAlign.start,
        )): SizedBox(height : 10.0);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.assetNetwork(
                  placeholder: placeHolderAsset,
                  image: storeItem.logo,
                  width: 69.0,
                  height: 69.0,
                  fit: BoxFit.fill,
                ),
              )),
          Expanded(
            child: Container(
                height: 200,
                margin: const EdgeInsets.only(top: 10.0, left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          storeItem.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.boldTextColor),
                          textAlign: TextAlign.start,
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          storeItem.tag,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: AppColors.greyMedium),
                          textAlign: TextAlign.start,
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${storeItem.openAt} - ${storeItem.closeAt}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Colors.black),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                ". Envio ${deliveryServiceMsg}",
                                style: TextStyle(
                                    fontWeight: deliverFontWeight,
                                    fontSize: 13,
                                    color: deliveryCostColor),
                                textAlign: TextAlign.start,
                              )
                            ])),
                    promoWidget,
                    storeClosedWidget,
                  ],
                )),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.itemBackgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

}