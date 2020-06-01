import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/extensions/number_extensions.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
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
      appBar: AppBar(leading: InkWell(onTap: () => Navigator.pop(context), child: Icon(Icons.close)), elevation: 0),
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
                buildOrderInfoCard(context, order),
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

  Widget buildOrderInfoCard(BuildContext context, OrderEntity orderEntity) {
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
