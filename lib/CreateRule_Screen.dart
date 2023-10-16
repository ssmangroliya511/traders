// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:traders/Static_Widgets.dart';
import 'Drawerr.dart';

class CreateRule_Screen extends StatefulWidget {
  const CreateRule_Screen({super.key});

  @override
  State<CreateRule_Screen> createState() => _CreateRule_ScreenState();
}

class _CreateRule_ScreenState extends State<CreateRule_Screen> {
  final GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();

  var isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key:drawerkey,

      appBar: WidgetAppBar(),

      drawer:Drawerr(),

      body:ScrollConfiguration(
        behavior: ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch
        ),
        child: SingleChildScrollView(
          padding:EdgeInsets.all(10),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left:3,bottom:10),
                child: Text('Your Created Rules',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,fontSize:13,color:Colors.black54)
                ),
              ),

              Container(
                width:double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom:10),
                decoration:BoxDecoration(
                    color:Colors.white,borderRadius: BorderRadius.circular(7),
                    border: Border.all(color:Colors.blueAccent.shade700,width:0.5)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ToggleSwitch(
                          minWidth:68,minHeight:30,cornerRadius:5,
                          labels: ['Rule 1','Rule 2',], fontSize:11,
                          activeBgColors: [
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

                        GFButton(
                          text:'Delete Rule',size:30,
                          color: Colors.red,
                          icon: Icon(Icons.delete,size:16,color:Colors.white,),
                          shape:GFButtonShape.pills,
                          textStyle:GoogleFonts.ptSans(fontSize:13),
                          onPressed: () {

                        },),
                      ],
                    ),

                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:5,itemBuilder: (context, index) {
                      return Container(
                          width:double.infinity,
                          margin:EdgeInsets.only(top:10),
                          padding:EdgeInsets.only(top:7,bottom:7,left:10,right:10),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                              color:isSelected == index ?
                                 Colors.blue.shade50.withOpacity(0.5) : Colors.white,
                              border: Border.all(color: Colors.black,width:0.1)
                          ),
                          child:Text('Rule Description 1',style:GoogleFonts.aBeeZee(fontSize:13))
                        );
                      },
                    ),
                  ],
                ),
              ),

              Container(
                width:double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom:10),
                decoration:BoxDecoration(
                    color:Colors.white,borderRadius: BorderRadius.circular(7),
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:3,bottom:15),
                      child: Text('+ Create New Rules',style:GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,fontSize:13,color:Colors.green.shade400)
                      ),
                    ),

                    /// RULE STRATEGY FIELD ............................
                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                        color:Colors.grey,borderRadius: BorderRadius.circular(5),
                        boxShadow: [BoxShadow(
                          color:Colors.black45,blurRadius:6,spreadRadius:-5
                        )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cstrategy,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.ptSansCaption(fontSize:13),
                        textInputAction:TextInputAction.next,
                        textCapitalization:TextCapitalization.words,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Enter Rule Strategy',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.file_ruled,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cstrategy.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cstrategy.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left:3,top:10,bottom:15),
                      child: Text('Enter Your Rule Description Here :-',style:GoogleFonts.ptSans(
                          fontWeight: FontWeight.w500,fontSize:13,color:Colors.blueAccent.shade100)
                      ),
                    ),

                    /// RULE DESCRIPTIONS FIELDS ............................
                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                          color:Colors.grey,borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                              color:Colors.black45,blurRadius:6,spreadRadius:-5
                          )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cdescription1,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.ptSansCaption(fontSize:13),
                        textInputAction:TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics:NeverScrollableScrollPhysics(),
                        maxLines:null,textCapitalization: TextCapitalization.sentences,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Rule Description 1',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.pen,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cdescription1.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cdescription1.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                          color:Colors.grey,borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                              color:Colors.black45,blurRadius:6,spreadRadius:-5
                          )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cdescription2,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.ptSansCaption(fontSize:13),
                        textInputAction:TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics:NeverScrollableScrollPhysics(),
                        maxLines:null,textCapitalization: TextCapitalization.sentences,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Rule Description 2',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            // 
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.pen,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cdescription2.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cdescription2.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                          color:Colors.grey,borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                              color:Colors.black45,blurRadius:6,spreadRadius:-5
                          )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cdescription3,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.ptSansCaption(fontSize:13),
                        textInputAction:TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics:NeverScrollableScrollPhysics(),
                        maxLines:null,textCapitalization: TextCapitalization.sentences,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Rule Description 3',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.pen,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cdescription3.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cdescription3.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                          color:Colors.grey,borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                              color:Colors.black45,blurRadius:6,spreadRadius:-5
                          )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cdescription4,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.ptSansCaption(fontSize:13),
                        textInputAction:TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics:NeverScrollableScrollPhysics(),
                        maxLines:null,textCapitalization: TextCapitalization.sentences,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Rule Description 4',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.pen,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cdescription4.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cdescription4.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                          color:Colors.grey,borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                              color:Colors.black45,blurRadius:6,spreadRadius:-5
                          )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cdescription5,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.ptSansCaption(fontSize:13),
                        textInputAction:TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics:NeverScrollableScrollPhysics(),
                        maxLines:null,textCapitalization: TextCapitalization.sentences,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Rule Description 5',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.pen,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cdescription5.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cdescription5.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                          color:Colors.grey,borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                              color:Colors.black45,blurRadius:6,spreadRadius:-5
                          )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cdescription6,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.ptSansCaption(fontSize:13),
                        textInputAction:TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics:NeverScrollableScrollPhysics(),
                        maxLines:null,textCapitalization: TextCapitalization.sentences,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Rule Description 6',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.pen,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cdescription6.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cdescription6.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                          color:Colors.grey,borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                              color:Colors.black45,blurRadius:6,spreadRadius:-5
                          )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cdescription7,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.ptSansCaption(fontSize:13),
                        textInputAction:TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics:NeverScrollableScrollPhysics(),
                        maxLines:null,textCapitalization: TextCapitalization.sentences,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Rule Description 7',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.pen,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cdescription7.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cdescription7.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                          color:Colors.grey,borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                              color:Colors.black45,blurRadius:6,spreadRadius:-5
                          )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cdescription8,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.ptSansCaption(fontSize:13),
                        textInputAction:TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics:NeverScrollableScrollPhysics(),
                        maxLines:null,textCapitalization: TextCapitalization.sentences,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Rule Description 8',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.pen,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cdescription8.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cdescription8.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                          color:Colors.grey,borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                              color:Colors.black45,blurRadius:6,spreadRadius:-5
                          )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cdescription9,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.ptSansCaption(fontSize:13),
                        textInputAction:TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics:NeverScrollableScrollPhysics(),
                        maxLines:null,textCapitalization: TextCapitalization.sentences,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Rule Description 9',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.pen,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cdescription9.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cdescription9.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom:8),
                      decoration:BoxDecoration(
                          color:Colors.grey,borderRadius: BorderRadius.circular(5),
                          boxShadow: [BoxShadow(
                              color:Colors.black45,blurRadius:6,spreadRadius:-5
                          )]
                      ),
                      child: TextField(
                        onChanged: (value) {  setState(() {}); },
                        controller:Controller.cdescription10,
                        cursorColor:Colors.blueAccent,cursorWidth:1,cursorHeight:15,
                        style:GoogleFonts.roboto(fontSize:13),
                        textInputAction:TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        scrollPhysics:NeverScrollableScrollPhysics(),
                        maxLines:null,textCapitalization: TextCapitalization.sentences,
                        maxLength:200,
                        decoration:InputDecoration(
                            filled:true,fillColor:Colors.white,counterText:'',
                            isDense: true, hintText:'Rule Description 10',
                            hintStyle:GoogleFonts.ptSansCaption(fontSize:12.5),
                            
                            contentPadding: EdgeInsets.only(top:15),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:BorderRadius.circular(5),
                                borderSide: BorderSide(color:Colors.green,width:0.4)
                            ),
                            prefixIcon: Icon(Bootstrap.pen,size:14,color: Colors.blueAccent),
                            suffixIcon: Controller.cdescription10.text.isNotEmpty ? IconButton(
                                splashColor:Colors.transparent,highlightColor:Colors.transparent,
                                onPressed: () { setState(() { Controller.cdescription10.text = ''; } );
                                }, icon: Icon(CupertinoIcons.delete_solid,size:16,color:Colors.blueAccent)) : SizedBox()
                        ),
                      ),
                    ),


                    /// CREATE RULE BUTTON ..................................
                    InkWell(
                      splashColor:Colors.black,highlightColor:Colors.black,
                      splashFactory: InkSparkle.splashFactory,
                      onTap: () {},
                      child: Container(
                          height:42,width:Get.width/1,
                          margin: EdgeInsets.only(top:20),
                          decoration:BoxDecoration(
                              color:Colors.blueAccent.shade700,
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Colors.green.shade700,Colors.green,Colors.green.shade400
                              ])
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Create Rule',style:GoogleFonts.poppins(color:Colors.white)),
                              SizedBox(width:7),
                              Icon(FontAwesome.check,size:15,color:Colors.white,)
                            ],
                          )
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  WidgetAppBar(){
    return  AppBar(
      centerTitle: true,elevation:0,toolbarHeight:47,
      backgroundColor:Colors.green,
      leading: IconButton(
          splashColor: Colors.transparent,highlightColor: Colors.transparent,
          onPressed: () {
            setState(() {
              drawerkey.currentState!.openDrawer();
            });
          }, icon: Icon(Icons.horizontal_split_outlined,size:20)),
      title: Text('Create Rules',style:GoogleFonts.aboreto(
          fontSize:15,fontWeight:FontWeight.w600)
      ),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.green),
    );
  }
}
