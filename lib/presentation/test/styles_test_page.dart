import 'package:LaCoro/presentation/core/ui/app_text_style.dart';
import 'package:LaCoro/presentation/core/ui/app_text_style.dart';
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
              Spacer(flex: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200,
                    child: Expanded(
                        child: Text("Titulos, Appbar, SubSeccines,", maxLines: 4,)),
                  ),
                  Column(
                    children: <Widget>[
                      Text("title",
                          style: AppTextStyle.title),
                      Text("appBar",
                          style: AppTextStyle.appBar),
                      Text("section",
                          style: AppTextStyle.section),
                    ],
                  )
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 220,
                    child: Expanded(
                      child: Text(
                        "16px, titles stores, titles PopUp, text search, adress y result en search, sug busqueda",
                        textAlign: TextAlign.justify,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: <Widget>[
                        Text("boldBlack16",
                            style: AppTextStyle.boldBlack16),
                        Text("w500Black16",
                            style: AppTextStyle.w500Black16),
                        Text("blue16",
                            style: AppTextStyle.black16),
                        Text("black16",
                            style: AppTextStyle.black16),
                        Text("grey16",
                            style: AppTextStyle.grey16),
                        Text("yellow16",
                            style: AppTextStyle.yellow16),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "13 px, envio gratis List_store, botones de PopUp, horarios stores, subtitles Stores, horario apertura Stores",
                      textAlign: TextAlign.justify,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: <Widget>[
                        Text("boldBlue13",
                            style: AppTextStyle.boldBlue13),
                        Text("w500Blue13",
                            style:AppTextStyle.w500Blue13),
                        Text("black13",
                            style: AppTextStyle.black13),
                        Text("grey13",
                            style: AppTextStyle.grey13),
                        Text("yellow13",
                            style:AppTextStyle.yellow13),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(flex: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
