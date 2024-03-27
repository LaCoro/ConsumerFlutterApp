import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/extensions/number_extensions.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/primary_button.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/product_item.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/product_item_info.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/store_item_small.dart';
import 'package:LaCoro/core/ui_utils/model/item_ui.dart';
import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:LaCoro/presentation/checkout/checkout_page.dart';
import 'package:LaCoro/presentation/order_detail/order_details_bloc.dart';
import 'package:LaCoro/presentation/past_order_detail/past_order_details_bloc.dart';
import 'package:LaCoro/presentation/register/register_page.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PastOrderDetailPage extends StatefulWidget {
  static const PAST_ORDER_DETAIL_ROUTE = '/past_order_detail_route';

  @override
  State<StatefulWidget> createState() => _PastOrderDetailPageState(Injector().get());
}

class _PastOrderDetailPageState extends State<PastOrderDetailPage> {
  final PastOrderDetailsBloc _bloc;

  _PastOrderDetailPageState(this._bloc);

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    final OrderEntity order = ModalRoute.of(context)!.settings.arguments as OrderEntity;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(elevation: 0, title: Text(strings.yourOrder, style: AppTextStyle.appBar)),
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            Map<ItemUI, int>? products;

            if (state is InitialState) {
              _bloc.add(GetOrderProductList(order.id));
            }

            if (state is SuccessState<Map<ItemUI, int>>) {
              products = state.data;
            }

            return Column(children: [
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                      child: StoreItemSmall(StoreUI.fromEntity(order.storeEntity)),
                    ),
                    Divider(thickness: 10, height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: Text(DateFormat('dd/MM/yyyy  -  HH:mm').format(order.createdAt), style: AppTextStyle.black16),
                    ),
                    Divider(thickness: 10, height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: buildItemList(products),
                    ),
                    Divider(thickness: 10, height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(strings.order, style: AppTextStyle.black16),
                          Text((order.totalAmount - order.deliveryCost).currencyFormat() ?? '', style: AppTextStyle.black16),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0, left: 24.0, right: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(strings.delivery, style: AppTextStyle.black16),
                          Text(order.deliveryCost?.currencyFormat() ?? '', style: AppTextStyle.black16),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(strings.total, style: AppTextStyle.section),
                          Text(order.totalAmount?.currencyFormat() ?? '', style: AppTextStyle.section),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(order.additionalRequests),
                      ),
                    ),
                  ],
                ),
              )
            ]);
          }),
    );
  }

  Widget buildItemList(Map<ItemUI, int>? items) {
    return items == null
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: items.keys.map((element) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ProductItemInfo(itemUI: element, quantity: items[element]),
              );
            }).toList(),
          );
  }
}
