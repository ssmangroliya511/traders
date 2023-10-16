// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_print


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Home_Screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp (
      GetMaterialApp(
        title: 'Traders', debugShowCheckedModeBanner: false,
        home:Home_Screen(),
      )
  );
}


