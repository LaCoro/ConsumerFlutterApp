import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StylesTestPage extends StatelessWidget {
  static const STYLE_TEST_PAGE_ROUTE = '/style_test_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Spacer(flex: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text("Titulos Appbar, SubSeccines,", maxLines: 4,)),
                  Column(
                    children: <Widget>[
                      Text("bodyText 1",
                          style: Theme.of(context).textTheme.bodyText1),
                      Text("bodyText 2",
                          style: Theme.of(context).textTheme.bodyText2),
                      Text("bodyText 3",
                          style: Theme.of(context).textTheme.bodyText3),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "16 px, titles stores, titles PopUp, text search, adress y result en search,sug busqueda",
                      textAlign: TextAlign.justify,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: <Widget>[
                        Text("Headline 1",
                            style: Theme.of(context).textTheme.headline1),
                        Text("Headline 2",
                            style: Theme.of(context).textTheme.headline2),
                        Text("Headline 3",
                            style: Theme.of(context).textTheme.headline3),
                        Text("Headline 4",
                            style: Theme.of(context).textTheme.headline4),
                        Text("Headline 5",
                            style: Theme.of(context).textTheme.headline5),
                        Text("Headline 6",
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "13 px, envio gratis List_store, botones de PopUp, horaios Sstores, subtitles Stores, horario apertura Stores",
                      textAlign: TextAlign.justify,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: <Widget>[
                        Text("subtitle 1",
                            style: Theme.of(context).textTheme.subtitle1),
                        Text("subtitle 2",
                            style: Theme.of(context).textTheme.subtitle2),
                        Text("Overline",
                            style: Theme.of(context).textTheme.overline),
                        Text("button",
                            style: Theme.of(context).textTheme.button),
                        Text("Caption",
                            style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}
