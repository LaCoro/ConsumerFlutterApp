import 'package:flutter/material.dart';

class CurrentAdress extends StatelessWidget {
  String adress = "";

  CurrentAdress(this.adress);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Direccion de entrega",style: Theme.of(context).textTheme.headline5,),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.place, color: Colors.black, size: 24),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 24),
                    child: Text(
                      adress,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Align(
                    child: Text(
                  "Editar",
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
