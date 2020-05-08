import 'package:LaCoro/presentation/core/bloc/base_bloc.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/store_item.dart';
import 'package:LaCoro/presentation/core/ui/model/store_ui.dart';
import 'package:LaCoro/presentation/store_details/store_details_page.dart';
import 'package:LaCoro/presentation/store_list/store_list_bloc.dart';
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
  List<StoreUI> _stores;

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

            if (state is SuccessState<List<StoreUI>>) {
              _stores = state.data;
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
          return GestureDetector(
              onTap: () => Navigator.pushNamed(context, StoreDetailsPage.STORE_DETAILS_ROUTE, arguments: _stores[index]),
              child: StoreItem(
                placeHolderAsset: 'assets/loading_resource.gif',
                storeItem: _stores[index],
              ));
        },
        itemCount: _stores?.length ?? 0);
  }
}
