import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:flutter/material.dart';

class StoreItemSmall extends StatelessWidget {
  final StoreUI _storeUI;

  const StoreItemSmall(this._storeUI);

  @override
  Widget build(BuildContext context) {
    final deliveryCostColor = _storeUI.isDeliveryFree ? AppColors.indicatorColor : AppColors.boldTextColor;

    final deliveryServiceMsg = _storeUI.isDeliveryFree ? "gratis" : "\$${_storeUI.deliveryCost}";

    return Container(
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Opacity(
            opacity: _storeUI.isStoreClosed ? 0.4 : 1.0,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                      _storeUI.logo, width: 60, fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_storeUI.name, style: AppTextStyle.boldBlack16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${_storeUI.openAt} - ${_storeUI.closeAt}", style: AppTextStyle.black14),
                      SizedBox(width: 16.0),
                      Text("Envio $deliveryServiceMsg", style: AppTextStyle.black14.copyWith(color: deliveryCostColor)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
