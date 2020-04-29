import 'package:LaCoro/presentation/core/ui/app_colors.dart';
import 'package:LaCoro/presentation/core/ui/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StylesTestPage extends StatelessWidget {
  static const STYLE_TEST_PAGE_ROUTE = '/style_test_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Headline 1", style: Theme.of(context).textTheme.headline1),
              Container(color: AppColors.accentColor, child: Text("Headline 2", style: Theme.of(context).textTheme.headline2)),
              Text("Headline 3", style: Theme.of(context).textTheme.headline3),
              Text("Headline 4", style: Theme.of(context).textTheme.headline4),
              Text("Headline 5", style: Theme.of(context).textTheme.headline5),
              FlatButton(
                child: Text("Headline 6", style: Theme.of(context).textTheme.headline6),
                onPressed: () {},
              ),
              Text("Overline", style: Theme.of(context).textTheme.overline),
              Text("Body text 1", style: Theme.of(context).textTheme.bodyText1),
              Text("Caption", style: Theme.of(context).textTheme.caption),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(6.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text("Button", style: Theme.of(context).textTheme.button),
                        ),
                        onPressed: () {},
                        color: AppColors.accentColor),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
