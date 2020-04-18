import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:data/remote_datasource/api/store_api.dart';

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
        child: CustomScrollView(
          slivers: [
            RefreshBackground(), // <== Add AppBack background
            SliverList(delegate: SliverChildListDelegate(buildList()))
          ],
        ),
      ),
    );
  }

  void fetchStores() {
    StoreApi().getAllStroes().then((value) => {setState(() => _data = value)});
  }

  @override
  void initState() {
    fetchStores();
  }

  List<Widget> buildList() {
    return List.generate(
        _data?.length ?? 0,
            (index) =>
            Container(
              height: 100,
              child: Center(child: Text(_data[index])),
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ));
  }
}

class RefreshBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
          background: Image.network(
            "https://i.blogs.es/e22189/enterradores-africanos/1366_2000.jpeg",
            fit: BoxFit.cover,
          )),
    );
  }
}
