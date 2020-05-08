import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class CurrentAdress extends StatelessWidget {
  String adress = "";

  CurrentAdress(this.adress);

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 24,right: 24, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(strings.deliveryAddress,style: Theme.of(context).textTheme.bodyText2,),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.place, color: Colors.black, size: 24),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 30),
                    child: Text(
                      adress,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                Align(
                    child: Text(
                  strings.edit,
                  style: Theme.of(context).textTheme.headline6,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
