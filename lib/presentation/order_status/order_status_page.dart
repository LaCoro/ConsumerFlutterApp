import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/enums/payment_type.dart';
import 'package:LaCoro/core/extensions/number_extensions.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/payment_method.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/stepper_bar.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/successful_order_banner.dart';
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

    final OrderEntity order = _bloc.getLastOrder();
//    final OrderEntity order = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: AppColors.itemBackgroundColor,
      appBar: AppBar(leading: Icon(Icons.close), elevation: 0),
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is SuccessState<OrderEntity>) {
//              Navigator.pushNamedAndRemoveUntil(context, ORDER_STATUS_ROUTE, ModalRoute.withName(StoreListPage.STORE_LIST_ROUTE), arguments: state.data);
            }

            return Column(
              children: <Widget>[
                SuccessfulOrderBanner(),
                StepperBar(1, 3, "asd"),
                Divider(thickness: 8),
                buildOrderInfoCard(order),
                Divider(thickness: 8),
              ],
            );
          }),
    );
  }

  Widget buildOrderInfoCard(OrderEntity orderEntity) {
    return Row(
      children: <Widget>[
        Expanded(
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
            child: Column(
          children: <Widget>[
            PaymentMethod(PaymentType.cash),
            Text(orderEntity.totalAmount?.currencyFormat() ?? ''),
          ],
        ))
      ],
    );
  }
}
