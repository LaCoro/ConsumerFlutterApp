import 'package:LaCoro/presentation/core/ui/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressesPage extends StatelessWidget{

  static const ADDRESSES_LIST_ROUTE = '/addresses_list';

  final addresses = ['Avenida siempre viva # 786', 'Carrera 40 # 87N -60'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            icon: const Icon(Icons.clear, color: Colors.blue, size: 30),
            onPressed: () {},
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
        child: Column(
          children: <Widget>[
            Text("Agrega o escoge una dirección", style: Theme.of(context).textTheme.headline1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                shadowColor: grayMedium,
                elevation: 2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: "Buscar tu dirección",
                          hintStyle: Theme.of(context).textTheme.caption,
                          prefixIcon: Icon(Icons.search, color: grayMedium, size: 24),
                          suffixIcon: Icon(Icons.cancel, color: Colors.black, size: 24),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.text, style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Divider(thickness: 1, color: divider),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.place, color: Colors.black, size: 24),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("Usar mi ubicación actual", style: Theme.of(context).textTheme.bodyText2,),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                          child: Icon(Icons.chevron_right, color: Colors.black, size: 24)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 15.0),
              child: Divider(thickness: 8, color: grayLight),
            ),
            Padding(
              padding: const EdgeInsets. only(top: 15.0),
              child: Align(alignment: Alignment.centerLeft, child: Text("Mis direcciones", style: Theme.of(context).textTheme.headline5)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    trailing: Icon(Icons.check_circle, color: accentColor, size: 24),
                    title: Text('${addresses[index]}', style: Theme.of(context).textTheme.bodyText1),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}