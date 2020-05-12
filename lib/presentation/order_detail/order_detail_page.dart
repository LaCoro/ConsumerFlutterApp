import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/product_item.dart';
import 'package:LaCoro/core/ui_utils/custom_widgets/restaurant_order_details.dart';
import 'package:LaCoro/core/ui_utils/model/item_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetailPage extends StatefulWidget {
  static const ORDER_DETAIL_ROUTE = '/order_detail_route';

  @override
  State<StatefulWidget> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {

  var _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final strings = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 12.0),
                  child: Align(alignment: Alignment.centerLeft, child: Text(strings.yourOrder, style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: RestaurantOrderDetails(),
              ),
              Divider(thickness: 8, color: AppColors.greyLight),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                //child: buildItemList(items),
              ),
              Divider(thickness: 8, color: AppColors.greyLight),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(strings.order, style: GoogleFonts.roboto(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: AppColors.boldTextColor
                    ),
                    ),
                    Text("\$21.000", style: GoogleFonts.roboto(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: AppColors.boldTextColor
                    ),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, left: 24.0, right: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(strings.delivery, style: GoogleFonts.roboto(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: AppColors.boldTextColor
                    ),
                    ),
                    Text("\$21.000", style: GoogleFonts.roboto(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: AppColors.boldTextColor
                    ),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(strings.total, style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: AppColors.boldTextColor
                    ),),
                    Text("\$21.000", style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.boldTextColor
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 24.0, right: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(strings.comments, style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.boldTextColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 24.0, right: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    controller: _commentController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16)),
                    decoration: InputDecoration(
                      isDense: true,
                      hintStyle:TextStyle(color: AppColors.greyMedium, fontWeight: FontWeight.w300, fontSize: 16),
                      hintText: strings.comments,
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.greyMedium)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(6.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(strings.continu, style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                            ),
                            onPressed: () {},
                            color: AppColors.accentColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemList(List<ItemUI> items) {
    return items == null
        ? Center(child: CircularProgressIndicator())
        : ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 10,
          height: 50,
          color: Theme.of(context).backgroundColor,
        ),
        itemCount: items?.length ?? 0,
        itemBuilder: (c, i) {
          return ProductItem(
            itemUI: items[i],
            onQuantityChange: (value) => null,
          );
        });
  }
}
