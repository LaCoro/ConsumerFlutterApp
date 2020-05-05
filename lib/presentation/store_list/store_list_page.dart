import 'package:LaCoro/presentation/core/bloc/base_bloc.dart';
import 'package:LaCoro/presentation/core/di/store_list_module.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/store_item.dart';
import 'package:LaCoro/presentation/store_details/store_details_page.dart';
import 'package:LaCoro/presentation/store_list/store_list_bloc.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StoreListPage extends StatefulWidget {
  static const STORE_LIST_ROUTE = '/store_list';

  @override
  _StoreListPageState createState() => _StoreListPageState((Injector.getInjector().get()));
}

class _StoreListPageState extends State<StoreListPage> {
  final RefreshController _refreshController = RefreshController();

  final StoreListBloc _bloc;
  List<StoreEntity> _data;

  _StoreListPageState(this._bloc);

  @override
  void initState() {
    super.initState();
    fetchStores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            _refreshController.refreshCompleted();
            if (state is LoadingState) return Center(child: CircularProgressIndicator());

            if (state is SuccessState<List<StoreEntity>>) {
              _data = state.data;
            }
            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              onRefresh: () => fetchStores(),
              child: buildList(),
            );
          }),
    );
  }

  void fetchStores() {
    _bloc.add(GetAllStoresEvent("test"));
  }

  Widget buildList() {
    return ListView.builder(
        itemExtent: 150.0,
        itemBuilder: (c, index) {
          var isDeliveryFree = _data[index].deliveryCost == null || _data[index].deliveryCost == 0 ? true : false;

          var hasAPromo = false;

          var storeClosed = !_data[index].active;

          var randomTag = "";
          if (_data[index].searchTags.isNotEmpty) {
            _data[index].searchTags.shuffle();
          }
          randomTag = _data[index].searchTags.last;

          return GestureDetector(
              onTap: () => Navigator.pushNamed(context, StoreDetailsPage.STORE_DETAILS_ROUTE, arguments: _data[index]),
              child: StoreItem(
                isDeliveryFree: isDeliveryFree,
                storeClosed: storeClosed,
                hasAPromo: hasAPromo,
                tag: randomTag,
                placeHolderAsset: 'assets/loading_resource.gif',
                storeItem: _data[index],
              ));
        },
        itemCount: _data?.length ?? 0);
  }
}
