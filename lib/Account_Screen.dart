// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Drawerr.dart';

class Account_Screen extends StatefulWidget {
  const Account_Screen({super.key});

  @override
  State<Account_Screen> createState() => _Account_ScreenState();
}

class _Account_ScreenState extends State<Account_Screen> {
  final GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key:drawerkey,

      appBar: WidgetAppBar(),

      drawer:Drawerr(),
    );
  }


  WidgetAppBar(){
    return  AppBar(
      centerTitle: true,elevation:0,toolbarHeight:47,
      backgroundColor:Colors.blueAccent.shade700,
      leading: IconButton(
          splashColor: Colors.transparent,highlightColor: Colors.transparent,
          onPressed: () {
            setState(() {
              drawerkey.currentState!.openDrawer();
            });
      }, icon: Icon(Icons.horizontal_split_outlined,size:20)),
      title: Text('Account',style:GoogleFonts.aboreto(
          fontSize:15,fontWeight:FontWeight.w600)
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blueAccent.shade700
      ),
    );
  }
}
