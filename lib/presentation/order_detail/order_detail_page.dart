import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/extensions/number_extensions.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/primary_button.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/product_item.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/store_item_small.dart';
import 'package:LaCoro/core/ui_utils/model/item_ui.dart';
import 'package:LaCoro/presentation/checkout/checkout_page.dart';
import 'package:LaCoro/presentation/order_detail/order_details_bloc.dart';
import 'package:LaCoro/presentation/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailPage extends StatefulWidget {
  static const ORDER_DETAIL_ROUTE = '/order_detail_route';

  @override
  State<StatefulWidget> createState() => _OrderDetailPageState(Injector.getInjector().get());
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final OrderDetailsBloc _bloc;

  _OrderDetailPageState(this._bloc);

  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    _bloc.store = (ModalRoute.of(context).settings.arguments as List).elementAt(0);
    _bloc.products = (ModalRoute.of(context).settings.arguments as List).elementAt(1);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(strings.yourOrder, style: AppTextStyle.section.copyWith(color: Colors.black)),
      ),
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            double cartTotal = 0;
            int deliveryCost = 0;

            if (state is InitialState) _bloc.add(GetOrderSummaryEvent());

            if (state is OrderSummarySate) {
              cartTotal = state.cartTotal;
              deliveryCost = state.deliveryCost;
            }

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                    child: StoreItemSmall(_bloc.store),
                  ),
                  Divider(thickness: 10, height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: buildItemList(_bloc.products),
                  ),
                  Divider(thickness: 10, height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(strings.order, style: AppTextStyle.black16),
                        Text(cartTotal?.currencyFormat() ?? '', style: AppTextStyle.black16),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, left: 24.0, right: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(strings.delivery, style: AppTextStyle.black16),
                        Text(deliveryCost?.currencyFormat() ?? '', style: AppTextStyle.black16),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(strings.total, style: AppTextStyle.section),
                        Text((cartTotal + deliveryCost)?.currencyFormat() ?? '', style: AppTextStyle.section),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 24.0, right: 24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        strings.comments,
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.boldTextColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        controller: _commentController,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        style: AppTextStyle.black16,
                        decoration: InputDecoration(
                          isDense: true,
                          hintStyle: TextStyle(color: AppColors.greyMedium, fontWeight: FontWeight.w300, fontSize: 16),
                          hintText: strings.comments,
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.greyMedium)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                        ),
                      ),
                    ),
                  ),
                  PrimaryButton(
                    margin: const EdgeInsets.all(24.0),
                    onPressed: cartTotal == 0
                        ? null
                        : () async {
                            final order = _bloc.createOrder(_commentController.value.text);
                            Navigator.pushNamed(context, await _bloc.isUserValidated() ? CheckoutPage.CHECKOUT_ORDER_ROUTE : RegisterPage.REGISTER_ROUTE,
                                arguments: order);
                          },
                    buttonText: strings.continu,
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget buildItemList(Map<ItemUI, int> items) {
    return items == null
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: items.keys.map((element) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ProductItem(
                  itemUI: element,
                  onQuantityChange: (value) => _bloc.add(UpdateProductEvent(element, value)),
                  quantity: items[element],
                  divider: false,
                ),
              );
            }).toList(),
          );
  }
}
