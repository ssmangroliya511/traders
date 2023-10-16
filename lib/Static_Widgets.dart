// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class Controller{

   static TextEditingController jjournal       = TextEditingController();

   static TextEditingController jstockname     = TextEditingController();
   static TextEditingController jentry         = TextEditingController();
   static TextEditingController jexit          = TextEditingController();
   static TextEditingController jqty           = TextEditingController();

   static TextEditingController cstrategy      = TextEditingController();
   static TextEditingController cdescription1  = TextEditingController();
   static TextEditingController cdescription2  = TextEditingController();
   static TextEditingController cdescription3  = TextEditingController();
   static TextEditingController cdescription4  = TextEditingController();
   static TextEditingController cdescription5  = TextEditingController();
   static TextEditingController cdescription6  = TextEditingController();
   static TextEditingController cdescription7  = TextEditingController();
   static TextEditingController cdescription8  = TextEditingController();
   static TextEditingController cdescription9  = TextEditingController();
   static TextEditingController cdescription10 = TextEditingController();
}


class Dialogss{
  static getExitApp_Dialog(BuildContext context)
  {
    return showDialog(
      barrierDismissible: false,
      context: context, builder: (context) =>
        AlertDialog(
          titlePadding:  EdgeInsets.only(left:10,top:10,bottom:10),
          contentPadding:EdgeInsets.only(left:15,right:10,top:5,bottom:5),
          actionsPadding:EdgeInsets.only(top:0,bottom:0),
          title: Row(
              children: [
                Padding(padding: EdgeInsets.only(bottom:3),
                child: Icon(BoxIcons.bx_exit,color:Colors.blueAccent.shade700,size:23)),
                Text('\t Exit Traders',style:GoogleFonts.poppins(color: Colors.blueAccent.shade700,
                    fontSize:17,fontWeight: FontWeight.w500,height:1.2)
                )
              ]),
          content:  Text('Do you want to exit an app ??',style:GoogleFonts.roboto(fontSize:14)),
          actions: <Widget>[
            GFButton(
                elevation: 0,color:Colors.white,size:30,
                child:  Text('N0',style:GoogleFonts.poppins(
                    color:Colors.blueAccent.shade700,fontWeight:FontWeight.w500)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                }
            ),

            GFButton(
                elevation: 0,color:Colors.white,size:30,
                child: Text('EXIT',style:GoogleFonts.poppins(
                    color:Colors.red,fontWeight:FontWeight.w500)),
                onPressed: () { exit(0); }),
          ],
        ),
    );
  }
}