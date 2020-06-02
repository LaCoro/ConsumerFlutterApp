import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/order_card_info.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryOrderPage extends StatefulWidget {
  static const HISTORY_ORDER_ROUTE = '/history_order';

  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  _HistoryOrderPageState();

  final RefreshController _refreshController = RefreshController();

  bool _loading = false;
  List<OrderEntity> _orders;


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(elevation: 0),
        body: Stack(children: [
          Column(
            children: <Widget>[
              Expanded(
                child: LazyLoadScrollView(
                  onEndOfPage: () {
//                    if (_orders != null && _orders.length >= OrderUseCases.PAGE_SIZE)
//                      _bloc.add(LoadMoreStoresEvent(searchQuery: _textFieldController.text.toString()));
                  },
                  child: SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
//                    onRefresh: () => _bloc.add(GetStoresEvent(searchQuery: _textFieldController.text.toString())),
                    child: buildList(),
                  ),
                ),
              ),
            ],
          ),
          Center(child: _loading ? CircularProgressIndicator() : null),
        ]));
  }

  Widget buildList() {
    return ListView.separated(
        separatorBuilder: (c, i) => Divider(),
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
}
