import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StoreListPage extends StatefulWidget {
  @override
  _StoreListPageState createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  final RefreshController _refreshController = RefreshController();

  List<String> _data;

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

  }

  @override
  void initState() {
    fetchStores();
  }

  Widget buildList() {
    return ListView.builder(
        itemExtent: 100.0,
        itemBuilder: (c, i) => Container(
              height: 100,
              child: Center(child: Text(_data[i])),
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
