import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/discount_chip.dart';
import '../app_colors.dart';


class StoreItem  extends StatelessWidget{

  String placeHolderAsset = "";
  StoreEntity storeItem = null;
  bool isDeliveryFree = false;
  bool hasAPromo = false;
  bool storeClosed = false;
  String discountPercentage ="";
  String tag="";


  StoreItem({Key key,
    this.isDeliveryFree,
    this.hasAPromo,
    this.storeClosed,
    this.discountPercentage,
    this.tag,
    this.storeItem,
    this.placeHolderAsset
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    var deliveryCostColor =
    isDeliveryFree ? AppColors.accentColor : AppColors.boldTextColor;

    var deliverFontWeight =
    isDeliveryFree ? FontWeight.bold : FontWeight.normal;

    var deliveryServiceMsg =
    isDeliveryFree ? "gratis" : "\$${storeItem.deliveryCost}";

    var promoWidget = hasAPromo?    Align(
        alignment: Alignment.topLeft,
        child: DiscountChip(discountPercentage: discountPercentage)): SizedBox(height : 10.0);

    var storeClosedWidget = storeClosed? Align(
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
                          tag,
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