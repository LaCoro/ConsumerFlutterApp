import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/bloc/base_bloc.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/order_status_banner.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/store_item.dart';
import 'package:LaCoro/core/ui_utils/model/store_ui.dart';
import 'package:LaCoro/presentation/adresses/my_address_page.dart';
import 'package:LaCoro/presentation/drawer/drawer_menu.dart';
import 'package:LaCoro/presentation/order_history/order_history_page.dart';
import 'package:LaCoro/presentation/order_status/order_status_page.dart';
import 'package:LaCoro/presentation/register/register_page.dart';
import 'package:LaCoro/presentation/store_details/store_details_page.dart';
import 'package:LaCoro/presentation/store_list/store_list_bloc.dart';
import 'package:domain/entities/order_entity.dart';
import 'package:domain/entities/order_status.dart';
import 'package:domain/use_cases/store_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StoreListPage extends StatefulWidget {
  static const STORE_LIST_ROUTE = '/store_list';

  @override
  _StoreListPageState createState() => _StoreListPageState((Injector.getInjector().get()));
}

class _StoreListPageState extends State<StoreListPage> {
  final RefreshController _refreshController = RefreshController();
  final StoreListBloc _bloc;
  FocusNode _focusNode;
  TextEditingController _textFieldController = TextEditingController(text: "");

  _StoreListPageState(this._bloc);

  OrderEntity lastOrder;
  List<StoreUI> _stores;
  String _searchQuery;
  bool _loading = false;
  bool _wasEmpty;

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      //TODO no funciona el desenfoque del textLabel al regresar a la lista
    });
    _bloc.add(GetStoresEvent(searchQuery: _textFieldController.text.toString()));
    _bloc.add(ValidateLastOrderEvent());

    _wasEmpty = _textFieldController.text.isEmpty;
    _textFieldController.addListener(() {
      if (_wasEmpty != _textFieldController.text.isEmpty) {
        setState(() => {_wasEmpty = _textFieldController.text.isEmpty});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    _focusNode.dispose();
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final currentAddress = _bloc.loadSavedAddress();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: DrawerMenu(
        onHistoryPressed: () async {
          await Navigator.pushNamed(context, await _bloc.isUserValidated() ? OrderHistoryPage.ORDER_HISTORY_ROUTE : RegisterPage.REGISTER_ROUTE);
          _bloc.add(ValidateLastOrderEvent());
        },
      ),
      appBar: AppBar(
          elevation: 0,
          title: GestureDetector(
            onTap: () async {
              await Navigator.pushNamed(context, MyAddressPage.MY_ADDRESS_ROUTE, arguments: [true, true]);
              _bloc.add(GetStoresEvent(searchQuery: _textFieldController.text.toString()));
              _bloc.add(ValidateLastOrderEvent());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('${currentAddress.address}, ${currentAddress.cityEntity.name}', style: AppTextStyle.section.copyWith(color: Colors.black)),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 36,
                  color: Theme.of(context).accentColor,
                )
              ],
            ),
          )),
      body: BlocListener(
        bloc: _bloc,
        listener: (context, state) {
          _refreshController.refreshCompleted();
          setState(() => handleCurrentState(state));
        },
        child: Stack(children: [
          Column(
            children: <Widget>[
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: lastOrder == null
                    ? SizedBox(height: 8)
                    : InkWell(
                        onTap: () async {
                          await Navigator.pushNamed(context, OrderStatusPage.ORDER_STATUS_ROUTE, arguments: lastOrder);
                          _bloc.add(ValidateLastOrderEvent());
                        },
                        child: OrderStatusBanner(),
                      ),
              ),
              Padding(
                // todo sacar en un widget
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  shadowColor: AppColors.greyMedium,
                  elevation: 2,
                  color: Colors.white,
                  child: TextField(
                      focusNode: _focusNode,
                      controller: _textFieldController,
                      onEditingComplete: () => setState(() => _searchQuery = _textFieldController.text.trim()),
                      decoration: InputDecoration(
                        filled: true,
                        //fillColor: Colors.red,
                        prefixIcon: Icon(Icons.search, color: AppColors.greyMedium, size: 24),
                        suffixIcon: _textFieldController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.cancel, color: Colors.black, size: 26),
                                onPressed: () {
                                  setState(() {
                                    _searchQuery = null;
                                    _textFieldController.clear();
                                    _textFieldController.text = "";
                                  });
                                  _bloc.add(GetStoresEvent());
                                },
                              )
                            : SizedBox(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          borderSide: BorderSide(
                            width: 2,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        hintText: strings.searchYourAddress,
                        hintStyle: AppTextStyle.grey16,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                      onSubmitted: (value) {
                        _bloc.add(GetStoresEvent(searchQuery: value));
                      }),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _searchQuery == null || _searchQuery.isEmpty ? SizedBox() : Text('Search for $_searchQuery'),
                    ),
                    Expanded(
                      child: LazyLoadScrollView(
                        onEndOfPage: () {
                          if (_stores != null && _stores.length >= StoreUseCases.PAGE_SIZE)
                            _bloc.add(LoadMoreStoresEvent(searchQuery: _textFieldController.text.toString()));
                        },
                        child: SmartRefresher(
                          controller: _refreshController,
                          enablePullDown: true,
                          onRefresh: () => _bloc.add(GetStoresEvent(searchQuery: _textFieldController.text.toString())),
                          child: buildList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(child: _loading ? CircularProgressIndicator() : null),
        ]),
      ),
    );
  }

  void handleCurrentState(state) {
    _loading = false;
    if (state is LoadingState) {
      _loading = true;
    } else if (state is SuccessState<List<StoreUI>>) {
      _stores = state.data;
    } else if (state is MoreStoresLoadedState) {
      _stores.addAll(state.data);
    } else if (state is SuccessState<OrderEntity>) {
      setLastOrderInfo(state.data);
    }
    //if (state is ErrorState)// TODO show error banner
  }

  Widget buildList() {
    return ListView.separated(
      separatorBuilder: (c, i) => SizedBox(height: 24.0),
      itemCount: _stores?.length ?? 0,
      itemBuilder: (c, index) {
        return InkWell(
          child: Hero(tag: _stores[index].name, child: StoreItem(storeItem: _stores[index])),
          onTap: () async {
            if (_focusNode.hasFocus) _textFieldController.clear();
            await Navigator.pushNamed(context, StoreDetailsPage.STORE_DETAILS_ROUTE, arguments: _stores[index]);
            _bloc.add(ValidateLastOrderEvent());
          },
        );
      },
    );
  }

  void setLastOrderInfo(OrderEntity order) {
    if (order.orderStatus.value == OrderStatus.ORDER_PLACED.value || order.orderStatus.value == OrderStatus.ORDER_IN_PROGRESS.value) {
      lastOrder = order;
      _bloc.subscribeOrderUpdates(lastOrder, (order) {
        setState(() {
          lastOrder = order;
        });
      });
    } else {
      _bloc.disposeOrderUpdates();
      lastOrder = null;
    }
  }
}
