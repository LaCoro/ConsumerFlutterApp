import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class DrawerMenu extends StatelessWidget {
  String userName;
  final Function onHistoryPressed;
  final Function onEditPressed;
  final Function onSettingsPressed;

  DrawerMenu({this.userName, this.onHistoryPressed, this.onEditPressed, this.onSettingsPressed}) {}

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Drawer(
      elevation: 20,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: CircleAvatar(
              backgroundColor: AppColors.accentColor,
              radius: 70.0,
              child: Text(userName?.substring(0, 1) ?? 'LC', style: TextStyle(fontSize: 60.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ListTile(
              leading: Icon(Icons.history, color: AppColors.greyMedium),
              title: Text(
                strings.history,
                style: AppTextStyle.black16.copyWith(fontSize: 18),
              ),
              onTap: onHistoryPressed,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListTile(
              leading: Icon(Icons.edit, color: AppColors.greyMedium),
              title: Text(
                strings.editProfile,
                style: AppTextStyle.black16.copyWith(fontSize: 18),
              ),
              onTap: onEditPressed,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListTile(
              leading: Icon(Icons.info_outline, color: AppColors.greyMedium),
              title: Text(
                strings.info,
                style: AppTextStyle.black16.copyWith(fontSize: 18),
              ),
              onTap: onSettingsPressed,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
                return Text(snapshot.data?.version ?? "");
              },
            ),
          ),
        ],
      ),
    );
  }
}
