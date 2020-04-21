import 'package:LaCoro/presentation/core/di/store_list_module.dart';
import 'package:LaCoro/presentation/store_list/store_list_bloc.dart';
import 'package:domain/entities/store_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StoreListPage extends StatefulWidget {
  @override
  _StoreListPageState createState() => _StoreListPageState(StoreListModule().initialise(Injector.getInjector()).get());
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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: () async {
          fetchStores();
          _refreshController.refreshCompleted();
        },
        child: buildList(),
      ),
    );
  }

  void fetchStores() {
    // TODO refactor this
    _bloc.getAllStores().then((value) {
      setState(() => _data = value);
    });
  }

  Widget buildList() {
    return ListView.builder(
        itemExtent: 100.0,
        itemBuilder: (c, i) => Container(
              height: 100,
              child: Center(child: Text(_data[i].name)),
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
        itemCount: _data?.length ?? 0);
  }
}
