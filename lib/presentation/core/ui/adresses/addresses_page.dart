
import 'package:LaCoro/presentation/core/ui/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressesPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
          child: IconButton(
            icon: const Icon(Icons.clear, color: Colors.blue, size: 30),
            onPressed: () {},
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 10.0, 10.0, 24.0),
        child: Column(
          children: <Widget>[
            Text("Agrega o escoge una direccion", style: Theme.of(context).textTheme.headline1),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                shadowColor: grayMedium,
                elevation: 2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
                  child: TextField(
                      decoration: InputDecoration(
                          hintText: "Buscar tu direccion",
                          prefixIcon: Icon(Icons.search, color: grayMedium, size: 24),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.text, style: Theme.of(context).textTheme.caption),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Divider(thickness: 1, color: divider, endIndent: 24.0),
            ),
          ],
        ),
      ),
    );
  }

}