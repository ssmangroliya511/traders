// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:traders/Account_Screen.dart';
import 'package:traders/CreateRule_Screen.dart';
import 'package:traders/Home_Screen.dart';
import 'package:traders/Journal_Screen.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({super.key});

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ScrollConfiguration(
        behavior: ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch
        ),
        child: Container(
          decoration:BoxDecoration(
            gradient: LinearGradient(
                begin:Alignment.topCenter, end:Alignment.bottomCenter,
                colors: [
                  Colors.blueAccent.shade700,Colors.blue.withOpacity(0.4)
            ])
          ),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top:60,bottom:40),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius:50,backgroundColor: Colors.white,
                        child: Icon(Iconsax.user,size:40,color:Colors.blueAccent.shade200,),
                      ),
                      SizedBox(height:10),
                      Text('Hello, John Deo',style:GoogleFonts.aboreto(
                          fontSize:12,color:Colors.white,fontWeight:FontWeight.w600),)
                    ],
                  )
              ),

              ListTile(
                leading:Icon(Iconsax.home,size:20,color:Colors.white,),
                title:Text("HOME",style:GoogleFonts.aBeeZee(fontSize:14.5,color:Colors.white)),
                trailing: Icon(Bootstrap.arrow_right,size:17,color:Colors.white),
                splashColor:Colors.blue.shade200,
                onTap: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) {
                    return Home_Screen();
                  },));
                },
              ),

              ListTile(
                leading:Icon(CupertinoIcons.rocket,size:20,color:Colors.white,),
                title:Text("JOURNAL",style:GoogleFonts.aBeeZee(fontSize:14.5,color:Colors.white)),
                trailing: Icon(Bootstrap.arrow_right,size:17,color:Colors.white),
                splashColor:Colors.blue.shade200,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                    return Journal_Screen();
                  },));
                },
              ),

              ListTile(
                leading:Icon(Iconsax.book,size:20,color:Colors.white,),
                title:Text("CREATE RULES",style:GoogleFonts.aBeeZee(fontSize:14.5,color:Colors.white)),
                trailing: Icon(Bootstrap.arrow_right,size:17,color:Colors.white),
                splashColor:Colors.blue.shade200,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                    return CreateRule_Screen();
                  },));
                },
              ),

              ListTile(
                leading:Icon(Iconsax.calculator,size:20,color:Colors.white,),
                title:Text("CALCULATOR",style:GoogleFonts.aBeeZee(fontSize:14.5,color:Colors.white)),
                trailing: Icon(Bootstrap.arrow_right,size:17,color:Colors.white),
                splashColor:Colors.blue.shade200,
                onTap: () {},
              ),

              ListTile(
                leading:Icon(Iconsax.blogger,size:20,color:Colors.white,),
                title:Text("BLOG",style:GoogleFonts.aBeeZee(fontSize:14.5,color:Colors.white)),
                trailing: Icon(Bootstrap.arrow_right,size:17,color:Colors.white),
                splashColor:Colors.blue.shade200,
                onTap: () {},
              ),

              ListTile(
                leading:Icon(Iconsax.user,size:20,color:Colors.white,),
                title:Text("ACCOUNT",style:GoogleFonts.aBeeZee(fontSize:14.5,color:Colors.white)),
                trailing: Icon(Bootstrap.arrow_right,size:17,color:Colors.white),
                splashColor:Colors.blue.shade200,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                    return Account_Screen();
                  },));
                },
              ),
              Spacer(),

              Padding(
                padding: EdgeInsets.only(bottom:30),
                child: MaterialButton(
                  color:Colors.white38,elevation:0,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(7)),
                  minWidth:Get.width/3,splashColor: Colors.red.shade100,
                  child:Row(
                    mainAxisSize:MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesome.right_from_bracket,size:14,color:Colors.red),
                      SizedBox(width:9),
                      Text('LOGOUT',style:GoogleFonts.ptSansCaption(color:Colors.red)),
                    ],
                  ),
                  onPressed: () {

                  },),
              ),


              Padding(
                padding: EdgeInsets.only(bottom:5),
                child: Text('Terms of Service | Privacy Policy',
                    style:GoogleFonts.roboto(fontSize:12,color:Colors.white54)
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
