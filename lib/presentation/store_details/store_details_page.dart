import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/cart_total_bottom.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/category_tabs.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/product_item.dart';
import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:LaCoro/presentation/store_details/store_details_bloc.dart';
import 'package:domain/entities/item_entity.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class StoreDetailsPage extends StatefulWidget {
  static const STORE_DETAILS_ROUTE = '/store_details';

  @override
  _StoreDetailsPageState createState() => _StoreDetailsPageState(StoreDetailsBloc(Injector.getInjector().get()));
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  final StoreDetailsBloc _bloc;
  final AutoScrollController _controller = AutoScrollController();

  _StoreDetailsPageState(this._bloc);

  @override
  Widget build(BuildContext context) {
    final StoreUI store = ModalRoute.of(context).settings.arguments;
    final strings = AppLocalizations.of(context);
    _bloc.store = store;

    Map<ItemEntity, List<ItemEntity>> itemList;
    int orderQuantity = 0;
    double cartTotal = 0;
    return Scaffold(
        appBar: AppBar(elevation: 0),

        body: SafeArea(
          child: BlocBuilder(
              bloc: _bloc,
              builder: (context, state) {
                // Handle states
                if (state is InitialState) _bloc.add(GetSortedItemsEvent());
                if (state is ErrorState) {
                  // todo show snack with error;
                }
                if (state is LoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is SuccessState<Map<ItemEntity, List<ItemEntity>>>) {
                  itemList = state.data;
                }

                if (state is OrderChangedSate) {
                  orderQuantity = state.quantity;
                  cartTotal = state.cartTotal;
                }

                // Build widget
                return Column(
                  children: <Widget>[
                    Expanded(flex: 2, child: Text(store.name)),
                    Expanded(
                        flex: 1,
                        child: CategoryTabs(
                          onCategorySelected: (category, position) {
                            _controller.scrollToIndex(position, duration: Duration(milliseconds: 500), preferPosition: AutoScrollPosition.begin);
                          },
                          categories: itemList.keys.map((e) => e.name).toList(),
                        )),
                    Expanded(flex: 10, child: buildItemList(itemList) ?? Center(/*todo agregar mensaje cuando no hay productos */)),
                    CartTotalBottom(orderQuantity, "\$$cartTotal"),
                  ],
                );
              }),
        ));
  }

  Widget buildItemList(Map<ItemEntity, List<ItemEntity>> items) {
    return items == null
        ? Center(child: CircularProgressIndicator())
        : ListView.separated(
            controller: _controller,
            separatorBuilder: (BuildContext context, int index) => Divider(
                  thickness: 10,
                  height: 50,
                  color: Theme.of(context).backgroundColor,
                ),
            itemCount: items?.length ?? 0,
            itemBuilder: (c, i) {
              final category = items.keys.elementAt(i);
              return AutoScrollTag(
                controller: _controller,
                index: i,
                key: ValueKey(i),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(12.0), child: Text(category.name, style: Theme.of(context).textTheme.headline4)),
                    Column(
                        children: items[category]
                            .map((e) => ProductItem(
                                  itemEntity: e,
                                  onQuantityChange: (value) => _bloc.add(UpdateProductEvent(e, value)),
                                ))
                            .toList()),
                  ],
                ),
              );
            });
  }
}
