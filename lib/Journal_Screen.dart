// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:traders/Static_Widgets.dart';
import 'Drawerr.dart';

class Journal_Screen extends StatefulWidget {
  const Journal_Screen({super.key});

  @override
  State<Journal_Screen> createState() => _Journal_ScreenState();
}

class _Journal_ScreenState extends State<Journal_Screen> {

  final GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();

  bool isBuy = false;
  bool isShortsell = false;
  var isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade100,
      key:drawerkey,

      appBar: WidgetAppBar(),

      drawer: Drawerr(),

      body:ScrollConfiguration(
        behavior: ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch
        ),
        child: SingleChildScrollView(
          padding:EdgeInsets.all(10),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// MAIN SEARCH FIELD ...........................
              Material(
                elevation:2,shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  onChanged: (value) {  setState(() {}); },
                  controller:Controller.jjournal,
                  cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                  style:GoogleFonts.ptSansCaption(fontSize:13),
                  textInputAction:TextInputAction.done,
                  decoration:InputDecoration(
                      filled:true,fillColor:Colors.white,
                      isDense: true, hintText:'Search for Datas & Reports . . .',
                      hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                      constraints:BoxConstraints.loose(Size.fromHeight(40)),
                      contentPadding: EdgeInsets.only(top:15),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10),borderSide: BorderSide.none
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10),borderSide: BorderSide.none
                      ),
                      prefixIcon: Icon(Bootstrap.search,size:14,color: Colors.blueAccent),
                      suffixIcon: Controller.jjournal.text.isNotEmpty ? IconButton(
                          splashColor:Colors.transparent,highlightColor:Colors.transparent,
                          onPressed: () { setState(() { Controller.jjournal.text = ''; } );
                          }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                  ),
                ),
              ),
              SizedBox(height:20),

              Text('Enter Your Journal',style:GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,fontSize:13,color:Colors.black54)
              ),

              Container(
                  width:double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom:10,top:10),
                  decoration:BoxDecoration(
                      color:Colors.white,borderRadius: BorderRadius.circular(7)
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ToggleSwitch(
                        minWidth:68,minHeight:30,cornerRadius:7,
                        labels: ['BUY', 'SELL'], fontSize:11,
                        icons: [Iconsax.buy_crypto,Icons.sell_rounded],
                        activeBgColors: [[Colors.green[600]!], [Colors.red[600]!]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex:0,radiusStyle: true,
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      ),

                      Padding(
                          padding: EdgeInsets.only(top:10,bottom:20),
                          child: Divider()
                      ),

                      /// STOCK NAME FIELD ...........................
                      TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller:Controller.jstockname,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.roboto(fontSize:12),
                        textInputAction:TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.blue.shade100.withOpacity(0.3),
                            isDense: true, hintText:'Stock Name',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            constraints:BoxConstraints.loose(Size.fromHeight(35)),
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.black,width:0.5)
                            ),
                            prefixIcon: Icon(Bootstrap.stack,size:14),
                            suffixIcon: Controller.jstockname.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.jstockname.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.red)) : SizedBox()
                        ),
                      ),
                      SizedBox(height:10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          /// ENTRY FIELD ...........................
                          SizedBox(
                            width:Get.width/3+30,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller:Controller.jentry,
                              cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                              style:GoogleFonts.roboto(fontSize:12),
                              textInputAction:TextInputAction.next,
                              keyboardType:TextInputType.phone,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration:InputDecoration(
                                  filled:true,fillColor:Colors.blue.shade100.withOpacity(0.3),
                                  isDense: true, hintText:'Entry',
                                  hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                                  constraints:BoxConstraints.loose(Size.fromHeight(35)),
                                  contentPadding: EdgeInsets.only(top:15),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(5),
                                      borderSide: BorderSide(color:Colors.black,width:0.5)
                                  ),
                                  prefixIcon: Icon(Iconsax.buy_crypto,size:14),
                                  suffixIcon: Controller.jentry.text.isNotEmpty ? IconButton(
                                      splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                      onPressed: () { setState(() { Controller.jentry.text = ''; } );
                                      }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.red)) : SizedBox()
                              ),
                            ),
                          ),

                          /// EXIT FIELD ...........................
                          SizedBox(
                            width:Get.width/3+30,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller:Controller.jexit,
                              cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                              style:GoogleFonts.roboto(fontSize:12),
                              textInputAction:TextInputAction.next,
                              keyboardType:TextInputType.phone,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration:InputDecoration(
                                  filled:true,fillColor:Colors.blue.shade100.withOpacity(0.3),
                                  isDense: true, hintText:'Exit',
                                  hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                                  constraints:BoxConstraints.loose(Size.fromHeight(35)),
                                  contentPadding: EdgeInsets.only(top:15),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(5),
                                      borderSide: BorderSide(color:Colors.black,width:0.5)
                                  ),
                                  prefixIcon: Icon(Icons.sell_rounded,size:14),
                                  suffixIcon: Controller.jexit.text.isNotEmpty ? IconButton(
                                      splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                      onPressed: () { setState(() { Controller.jexit.text = ''; } );
                                      }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.red)) : SizedBox()
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height:10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          /// QTY FIELD ...........................
                          SizedBox(
                            width:Get.width/3+30,
                            child: TextField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller:Controller.jqty,
                              cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                              style:GoogleFonts.roboto(fontSize:12),
                              textInputAction:TextInputAction.next,
                              keyboardType:TextInputType.phone,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration:InputDecoration(
                                  filled:true,fillColor:Colors.blue.shade100.withOpacity(0.3),
                                  isDense: true, hintText:'Oty',
                                  hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                                  constraints:BoxConstraints.loose(Size.fromHeight(35)),
                                  contentPadding: EdgeInsets.only(top:15),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:BorderRadius.circular(5),
                                      borderSide: BorderSide(color:Colors.black,width:0.5)
                                  ),
                                  prefixIcon: Icon(Iconsax.buy_crypto,size:14),
                                  suffixIcon: Controller.jqty.text.isNotEmpty ? IconButton(
                                      splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                      onPressed: () { setState(() { Controller.jqty.text = ''; } );
                                      }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.red)) : SizedBox()
                              ),
                            ),
                          ),

                          /// P & L BOX ...........................
                          Container(
                            height:35, width:Get.width/3+30,
                            decoration:BoxDecoration(
                               color:Colors.blue.shade100.withOpacity(0.3),
                                borderRadius:BorderRadius.circular(5)
                            ),
                            alignment: Alignment.center,
                            child:Text('P & L',style:GoogleFonts.ptSansCaption(fontSize:12.5,color:Colors.green),),
                          ),

                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top:10,bottom:20),
                          child: Divider()
                      ),

                      ToggleSwitch(
                        minWidth:68,minHeight:30,cornerRadius:5,
                        labels: ['Rule 1','Rule 2','Rule 3','Rule 4',], fontSize:11,
                        activeBgColors: [
                          [Colors.blueAccent[700]!],[Colors.blueAccent[700]!],
                          [Colors.blueAccent[700]!],[Colors.blueAccent[700]!],
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex:0,
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      ),
                      SizedBox(height:30),

                      Text('Rules Lists',style:GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,fontSize:13,color:Colors.black54)
                      ),

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:10,itemBuilder: (context, index) {
                        return Container(
                          width:double.infinity,
                          margin:EdgeInsets.only(top:10,bottom:10),
                          padding:EdgeInsets.only(top:7,bottom:7,left:10,right:10),
                          decoration:BoxDecoration(
                            color:isSelected == index ? Colors.blue.shade50.withOpacity(0.5) :
                               Colors.white,borderRadius:BorderRadius.circular(5),
                            border: Border.all(color: Colors.black,width:0.2)
                          ),
                          child:Row(
                            children: [
                              Expanded(
                                  child: Text('Rule Description 1',style:GoogleFonts.aBeeZee(fontSize:13))
                              ),

                              /// CLOSE ICON ....................
                              isSelected == index ?
                              Container(
                                height:34,width:34, margin: EdgeInsets.only(left:5,right:3),
                                decoration:BoxDecoration(
                                  color:Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(100),
                                  // border: Border.all(color:Colors.red)
                                ),
                                child:IconButton(onPressed: () {
                                  setState(() {
                                    isSelected = null;
                                  });
                                }, icon: Icon(CupertinoIcons.clear_circled,size:18,color:Colors.red)
                                ),
                              ) : SizedBox(),

                              /// CHECK ICON ....................
                              isSelected == index ?
                              Container(
                                height:34,width:34, margin: EdgeInsets.only(left:5),
                                decoration:BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.green,width:0.8)
                                ),
                                child:IconButton(onPressed: () {
                                  setState(() {  isSelected = index;  });
                                 }, icon:Icon(Bootstrap.check2_square,size:15,color:Colors.green)
                                ),
                              )
                                  :
                                 Container(
                                    height:34,width:34, margin: EdgeInsets.only(left:5),
                                    decoration:BoxDecoration(
                                      color:Colors.blue.shade50,borderRadius:BorderRadius.circular(100),
                                    ),
                                    child:IconButton(onPressed: () {
                                      setState(() {  isSelected = index;  });
                                      }, icon: Icon(Bootstrap.check2_square,size:15,color:Colors.blueAccent.shade700)
                                    ),
                                  )
                              ],
                            )
                          );
                        },
                      ),

                      /// SUBMIT BUTTON ..................................
                      InkWell(
                        splashColor:Colors.black,highlightColor:Colors.black,
                        splashFactory: InkSparkle.splashFactory,
                        onTap: () {},
                        child: Container(
                          height:42,width:Get.width/1,
                          margin: EdgeInsets.only(top:20),
                          decoration:BoxDecoration(
                            color:Colors.blueAccent.shade700,borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Colors.blueAccent.shade700,Colors.lightBlue,
                            ])
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Submit Journal',style:GoogleFonts.poppins(color:Colors.white)),
                              SizedBox(width:7),
                              Icon(Bootstrap.send,size:15,color:Colors.white,)
                            ],
                          )
                        ),
                      )
                    ],
                  )
               ),
             ],
           ),
        ),
      ),
    );
  }

  WidgetAppBar(){
    return AppBar(
      centerTitle: true,elevation:0,toolbarHeight:47,
      backgroundColor:Colors.blueAccent.shade700,

      leading: IconButton(
          splashColor: Colors.transparent,highlightColor: Colors.transparent,
          onPressed: () {
        setState(() {
          drawerkey.currentState!.openDrawer();
        });
      },icon: Icon(Icons.horizontal_split_outlined,size:20)),

      title: Text('Journal',style:GoogleFonts.aboreto(
          fontSize:14,fontWeight:FontWeight.w600)
      ),

      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blueAccent.shade700
      ),

      actions: [
        IconButton(
            splashColor: Colors.transparent,highlightColor:Colors.transparent,
            onPressed: () {
        },icon: Icon(FontAwesome.bell,size:17)),
      ],
    );
  }
}


