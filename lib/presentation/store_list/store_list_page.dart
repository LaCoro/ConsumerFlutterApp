import 'package:LaCoro/presentation/core/bloc/base_bloc.dart';
import 'package:LaCoro/presentation/core/di/store_list_module.dart';
import 'package:LaCoro/presentation/core/ui/custom_widgets/discount_chip.dart';
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
  _StoreListPageState createState() => _StoreListPageState(
      StoreListModule().initialise(Injector.getInjector()).get());
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
            if (state is LoadingState)
              return Center(child: CircularProgressIndicator());

            if (state is SuccessState<List<StoreEntity>>) {
              _data = state.data;
            }
            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              onRefresh: () async => fetchStores(),
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
          var isDeliveryFree = _data[index].deliveryCost == null ||
                  _data[index].deliveryCost == 0
              ? true
              : false;
          var deliveryMsg =
              isDeliveryFree ? "gratis" : "\$${_data[index].deliveryCost}";
          var deliveryCostColor =
              isDeliveryFree ? Color(0xFF3D9FE6) : Colors.black;
          var deliverFontWeight =
              isDeliveryFree ? FontWeight.bold : FontWeight.normal;
          var hasAPromo = true;

          var storeClosed = !_data[index].active;

          var promoWidget = hasAPromo?    Align(
              alignment: Alignment.topLeft,
              child: DiscountChip(discountPercentage: "15")): SizedBox(height : 10.0);
          var storeClosedWidget = storeClosed? Align(
          alignment: Alignment.centerLeft,
          child: Text(
          "Cerrado",
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Color(0xFFFFAC0C)),
          textAlign: TextAlign.start,
          )): SizedBox(height : 10.0);

          var randomTag = "";
          if (_data[index].searchTags.isNotEmpty) {
            _data[index].searchTags.shuffle();
          }
          randomTag = _data[index].searchTags.last;

          return GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, StoreDetailsPage.STORE_DETAILS_ROUTE,
                arguments: _data[index]),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/loading_resource.gif',
                          image: _data[index].logo,
                          width: 69.0,
                          height: 69.0,
                          fit: BoxFit.fill,
                        ),
                      )),
                  Expanded(
                    child: Container(
                        height: 200,
                        margin: const EdgeInsets.only(top: 10.0, left: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _data[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                  textAlign: TextAlign.start,
                                )),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  randomTag,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      color: Color(0xFF868686)),
                                  textAlign: TextAlign.start,
                                )),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${_data[index].openAt} - ${_data[index].closeAt}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13,
                                            color: Colors.black),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        ". Envio ${deliveryMsg}",
                                        style: TextStyle(
                                            fontWeight: deliverFontWeight,
                                            fontSize: 13,
                                            color: deliveryCostColor),
                                        textAlign: TextAlign.start,
                                      )
                                    ])),
                            promoWidget,
                            storeClosedWidget,
                          ],
                        )),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        },
        itemCount: _data?.length ?? 0);
  }
}
