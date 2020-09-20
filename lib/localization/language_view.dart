import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:developer';
import 'local_keys.dart';

class LanguageView extends StatelessWidget {
  @override


  Widget build(BuildContext context) {
    log(context.locale.toString(),
        name: '${this} # locale Context');
    log('title'.tr().toString(), name: '${this} # locale');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 26),
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text((LocaleKeys.title).tr(),
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            buildSwitchListTileMenuItem(
                context: context,
                title: 'Українська',
                locale: context.supportedLocales[1] //BuildContext extension method
            ),
            buildDivider(),
            buildSwitchListTileMenuItem(
                context: context,
                title: 'Русский',
                locale: EasyLocalization.of(context).supportedLocales[0]),
            buildDivider(),
            ],
        ),
      ),
    );
  }

  Container buildDivider() => Container(
    margin: EdgeInsets.symmetric(
      horizontal: 24,
    ),
    child: Divider(
      color: Colors.grey,
    ),
  );

  Container buildSwitchListTileMenuItem(
      {BuildContext context, String title, String subtitle, Locale locale}) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      child: ListTile(
          dense: true,
          // isThreeLine: true,
          title: Text(
            title,
          ),
          onTap: () {
            log(locale.toString(), name: toString());
            context.locale = locale; //BuildContext extension method
            //EasyLocalization.of(context).locale = locale;
            Navigator.pop(context);
          }),
    );
  }

}