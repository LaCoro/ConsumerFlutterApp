import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/extensions/number_extensions.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/order_card_info.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/stepper_bar.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/successful_order_banner.dart';
import 'package:LaCoro/presentation/order_detail/order_detail_page.dart';
import 'package:LaCoro/presentation/order_status/order_status_bloc.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class OrderStatusPage extends StatelessWidget {
  static const ORDER_STATUS_ROUTE = '/order_status';

  final OrderStatusBloc _bloc = Injector.getInjector().get();

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    final OrderEntity order = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: AppColors.itemBackgroundColor,
      appBar: AppBar(
          title: Text("Order status", style: AppTextStyle.section),
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close)),
          elevation: 0),
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is SuccessState<OrderEntity>) {
//              Navigator.pushNamedAndRemoveUntil(context, ORDER_STATUS_ROUTE, ModalRoute.withName(StoreListPage.STORE_LIST_ROUTE), arguments: state.data);
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SuccessfulOrderBanner(),
                StepperBar(1, 3, order?.status),
                Divider(thickness: 8),
                OrderCardInfo(orderEntity: order),
                Divider(thickness: 8),
                SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(strings.deliveryAddress, style: AppTextStyle.grey16),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(order.deliveryAddress ?? '', style: AppTextStyle.boldBlack16),
                ),
              ],
            );
          }),
    );
  }
}