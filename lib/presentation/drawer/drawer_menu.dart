
import 'package:LaCoro/core/appearance/app_colors.dart';
import 'package:LaCoro/core/appearance/app_text_style.dart';
import 'package:LaCoro/core/localization/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget{

  String userName;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Drawer(
      elevation: 20,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: CircleAvatar(
                  backgroundColor: AppColors.accentColor,
                  radius: 70.0,
                  child: Text("A", style: TextStyle(fontSize: 60.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ListTile(
                  leading: Icon(Icons.edit, color: AppColors.greyMedium),
                  title: Text('Editar Perfil', style: AppTextStyle.black16.copyWith(fontSize: 18),),
                  onTap: () {
                    // Update the state of the app.
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListTile(
                  leading: Icon(Icons.info, color: AppColors.greyMedium),
                  title: Text('Acerca de nosotros', style: AppTextStyle.black16.copyWith(fontSize: 18),),
                  onTap: () {
                    // Update the state of the app.
                  },
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListTile(
                      leading: Icon(Icons.power_settings_new, color: AppColors.greyMedium),
                      title: Text('Cerrar sesión', style: AppTextStyle.black16.copyWith(fontSize: 18),),
                      onTap: () {
                        // Update the state of the app.
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }

}