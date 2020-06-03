import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/order_card_info.dart';
import 'package:LaCoro/presentation/history_order_list/history_order_bloc.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/use_cases/order_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryOrderPage extends StatefulWidget {
  static const HISTORY_ORDER_ROUTE = '/history_order';

  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState(Injector.getInjector().get());
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  final HistoryOrderBloc _bloc;

  _HistoryOrderPageState(this._bloc);

  RefreshController _refreshController = RefreshController();
  bool _loading = false;
  List<OrderEntity> _orders;

  @override
  void initState() {
    _bloc.add(GetOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(elevation: 0, title: Text(strings.historyOrders, style: AppTextStyle.section)),
        body: BlocListener(
          bloc: _bloc,
          listener: handlePageStates,
          child: Stack(children: [
            Column(
              children: <Widget>[
                Expanded(
                  child: LazyLoadScrollView(
                    onEndOfPage: () {
                      if (_orders != null && _orders.length >= OrderUseCases.PAGE_SIZE) {
                        _bloc.add(LoadMoreOrdersEvent());
                      }
                    },
                    child: SmartRefresher(
                      controller: _refreshController,
                      enablePullDown: true,
                      onRefresh: () => _bloc.add(GetOrdersEvent()),
                      child: buildList(),
                    ),
                  ),
                ),
              ],
            ),
            Center(child: _loading ? CircularProgressIndicator() : null),
          ]),
        ));
  }

  Widget buildList() {
    return ListView.separated(
        separatorBuilder: (c, i) => SizedBox(height: 2),
        itemBuilder: (c, index) {
          return InkWell(
              onTap: () async {
//                await Navigator.pushNamed(context, OrderDetailPage.ORDER_DETAIL_ROUTE, arguments: _orders[index]);
//                setState(() {});
              },
              child: OrderCardInfo(orderEntity: _orders[index]));
        },
        itemCount: _orders?.length ?? 0);
  }

  void handlePageStates(BuildContext context, state) {
    setState(() => _loading = false);
    _refreshController.refreshCompleted();

    if (state is LoadingState) {
      setState(() => _loading = true);
    }

    if (state is SuccessState<List<OrderEntity>>) {
      setState(() => _orders = state.data);
    }

    if (state is MoreOrdersLoadedState) {
      setState(() => _orders.addAll(state.data));
    }
    //if (state is ErrorState)// TODO show error banner
  }
}
