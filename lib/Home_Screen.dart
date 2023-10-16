// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:traders/CreateRule_Screen.dart';
import 'package:traders/Static_Widgets.dart';


import 'Drawerr.dart';
import 'Journal_Screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();

  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];

  Map<String, double> dataMap1 = {
    "70%": 70,
    "30%": 30,
  };

  Map<String, double> dataMap2 = {
    "Service": 40,
    "Products": 60,
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      key:drawerkey,

      appBar: WidgetAppBar(),

      drawer: Drawerr(),

      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.green,tooltip:'Create Rules',
        child:Icon(FontAwesome.pen,size:14),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) {
            return CreateRule_Screen();
          },));
      },),

      body:WillPopScope(
        onWillPop:() {
          return Dialogss.getExitApp_Dialog(context);
        },
        child: ScrollConfiguration(
          behavior: ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          width:double.infinity,
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(bottom:10),
                          decoration:BoxDecoration(
                              color:Colors.white,borderRadius: BorderRadius.circular(7)
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(alignment: Alignment.topLeft,
                                  child: Text('Net P&L',style:GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,fontSize:13))
                              ),
                              SizedBox(height:30),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+ ₹7000',style:GoogleFonts.roboto(
                                      color:Colors.green,fontWeight:FontWeight.w600)
                                  ),

                                  SizedBox(
                                    height:40,width:Get.width/4,
                                    child: Sparkline(
                                      data:[1.0,1.0,2.5,1.0],lineWidth: 5.0,
                                      fillColor:Colors.blueAccent.shade100,
                                      lineColor: Colors.indigo,
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Text('+3.5%',style:GoogleFonts.roboto(color:Colors.blue,
                                          fontWeight:FontWeight.w600,height:1.5)
                                      ),
                                      SizedBox(width:5),
                                      Icon(Iconsax.arrow_up,size:20,color:Colors.blue,)
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                      ),
                      Positioned(
                          left:295,bottom:84,
                          child: Container(
                            height:45,width:45,
                            decoration:BoxDecoration(
                                color: Colors.indigo.withOpacity(0.2),
                                borderRadius:BorderRadius.only(
                                  topLeft:Radius.circular(1),
                                  topRight:Radius.circular(7),
                                  bottomLeft:Radius.circular(30),
                                  bottomRight:Radius.circular(0),
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:7,bottom:6),
                              child: Icon(Icons.blur_circular,size:25,color:Colors.indigo),
                            ),
                          )
                      )
                    ],
                  ),

                  Stack(
                    children: [
                      Container(
                          width:double.infinity,
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(bottom:10),
                          decoration:BoxDecoration(
                              color:Colors.white,borderRadius: BorderRadius.circular(7)
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(alignment: Alignment.topLeft,
                                  child: Text('Total Fund With P&L',style:GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,fontSize:13))
                              ),
                              SizedBox(height:30),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('₹57000',style:GoogleFonts.roboto(
                                      color:Colors.lightBlue,fontWeight:FontWeight.w600)
                                  ),
                                  SizedBox(
                                     height:40,width:Get.width/2+50,
                                     child: Sparkline(
                                      data:[1.0,1.5,2.5,2.6,1.7,2.1,2.0,1.0],
                                      lineWidth: 0.0,averageLine: true,
                                      enableThreshold: true,sharpCorners: true,
                                      useCubicSmoothing: true,
                                      fillColor:Colors.lightBlue.shade50,
                                      lineColor: Colors.indigo,
                                      fillMode:FillMode.below ,
                                    ),
                                  ),

                                ],
                              )
                            ],
                          )
                      ),
                      Positioned(
                          left:295,bottom:84,
                          child: Container(
                            height:45,width:45,
                            decoration:BoxDecoration(
                                color: Colors.pink.shade100.withOpacity(0.2),
                                borderRadius:BorderRadius.only(
                                  topLeft:Radius.circular(1),
                                  topRight:Radius.circular(7),
                                  bottomLeft:Radius.circular(30),
                                  bottomRight:Radius.circular(0),
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:7,bottom:6),
                              child: Icon(Icons.foundation_sharp,size:25,color:Colors.pink),
                            ),
                          )
                      )
                    ],
                  ),

                  Stack(
                    children: [
                      Container(
                          width:double.infinity,
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(bottom:10),
                          decoration:BoxDecoration(
                              color:Colors.white,borderRadius: BorderRadius.circular(7)
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(alignment: Alignment.topLeft,
                                  child: Text('Win %',style:GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,fontSize:13))
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height:10),
                                      Text('70 % Win Trade',style:GoogleFonts.roboto(
                                          color:Colors.green,fontWeight:FontWeight.w600)
                                      ),
                                      SizedBox(height:3),
                                      Text('30 % Win Trade',style:GoogleFonts.roboto(
                                          color:Colors.red,fontWeight:FontWeight.w600)
                                      ),
                                    ],
                                  ),
                                  PieChart(
                                    dataMap:dataMap1,totalValue: 100,
                                    animationDuration: Duration(milliseconds: 800),
                                    chartRadius:Get.width/5,
                                    colorList: [Colors.green,Colors.red],
                                    initialAngleInDegree:0,chartType: ChartType.ring,
                                    ringStrokeWidth:7,centerText: "Win Trade",
                                    legendOptions: LegendOptions(showLegends: false),
                                    chartValuesOptions: ChartValuesOptions(
                                        showChartValueBackground: true,
                                        showChartValues: true,
                                        showChartValuesInPercentage: true,
                                        showChartValuesOutside: false, decimalPlaces:1,
                                        chartValueStyle: GoogleFonts.roboto(fontSize:9,color:Colors.black)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      ),
                      Positioned(
                          left:295,bottom:103,
                          child: Container(
                            height:45,width:45,
                            decoration:BoxDecoration(
                                color: Colors.green.shade100.withOpacity(0.3),
                                borderRadius:BorderRadius.only(
                                  topLeft:Radius.circular(1),
                                  topRight:Radius.circular(7),
                                  bottomLeft:Radius.circular(30),
                                  bottomRight:Radius.circular(0),
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left:7,bottom:6),
                              child: Icon(LineAwesome.circle,size:25,color:Colors.green),
                            ),
                          )
                      )
                    ],
                  ),

                  Align( alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top:5,bottom:5),
                      child: Text('Journal Reports',style:GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,fontSize:13,color:Colors.black54)
                      ),
                    ),
                  ),

                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.push(context,CupertinoPageRoute(builder: (context) {
                        return Journal_Screen();
                      },));
                    },
                    child: Container(
                        width:double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration:BoxDecoration(
                          color:Colors.blueAccent,borderRadius: BorderRadius.circular(7),
                            gradient: LinearGradient(colors: [
                              Colors.blueAccent.shade700,Colors.blueAccent.shade400, Colors.blueAccent.shade200
                            ])
                        ),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.rocket,size:20,color:Colors.white),
                            SizedBox(width:15),
                            Text('ENTER YOUR JOURNAL',style:GoogleFonts.poppins(color:Colors.white,
                                fontWeight: FontWeight.w600,fontSize:13,letterSpacing:1)
                            ),
                            SizedBox(width:15),
                            Icon(Bootstrap.arrow_right,size:20,color:Colors.white54),
                          ],
                        )
                    ),
                  ),

                  Container(
                      width:double.infinity,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(top:17,bottom:10),
                      decoration:BoxDecoration(
                          color:Colors.white,borderRadius: BorderRadius.circular(7)
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(alignment: Alignment.topLeft,
                              child: Text('Win %',style:GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,fontSize:13))
                          ),

                          PieChart(
                            dataMap:dataMap2,totalValue:100,
                            animationDuration: Duration(milliseconds:800),
                            chartRadius:Get.width/4,
                            colorList: [Colors.pink,Colors.lightBlue],
                            initialAngleInDegree:130,chartType: ChartType.ring,
                            ringStrokeWidth:18,centerText: "",
                            legendOptions: LegendOptions(showLegends: true),
                            chartValuesOptions: ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesInPercentage: true,
                                showChartValuesOutside: false, decimalPlaces:1,
                                chartValueStyle: GoogleFonts.roboto(fontSize:9,color:Colors.black)
                            ),
                          ),
                        ],
                      )
                  ),

                  Container(
                      width:double.infinity,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom:10),
                      decoration:BoxDecoration(
                          color:Colors.white,borderRadius: BorderRadius.circular(7)
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Win %',style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,fontSize:13)),

                          SizedBox(
                            height:Get.height/3, width:Get.width/1+50,
                            child: Echarts(
                              reloadAfterInit: true,
                              captureAllGestures: true,captureHorizontalGestures: true,

                              option: '''
                                {
                                  xAxis: {
                                    type: 'category',
                                    data: ['May', 'June', 'July', 'Aug', 'Sept']
                                  },
                                  yAxis: {                              
                                    type: 'value'                             
                                  },
                                  series: [{
                                    data: [30, 932, 901, 934, 1290, 1330, 1320],
                                    type: 'line'         
                                  }],                           
                                }
                              ''',
                            ),
                          )
                        ],
                      )
                  ),

                  Container(
                      width:double.infinity,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom:10),
                      decoration:BoxDecoration(
                          color:Colors.white,borderRadius: BorderRadius.circular(7)
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Days P/L',style:GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,fontSize:13)),

                          SizedBox(
                            height:Get.height/3, width:double.infinity,
                            child: Echarts(
                              reloadAfterInit: true,
                              captureAllGestures: true,captureHorizontalGestures: true,
                              option: '''
                                {
                                  xAxis: {
                                    type: 'category',
                                    data: ['01/01/2023', '01/01/2023', '01/01/2023', '01/01/2023', '01/01/2023']
                                  },
                                  yAxis: {                              
                                    type: 'value'                             
                                  },
                                  series: [{
                                    data: [300, 992, 1000, 304, 120, 1000,720],
                                    type: 'line'         
                                  }],
                                  
                                }
                              ''',
                            ),
                          )
                        ],
                      )
                  ),

                ]
             )
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

      title: Text('Trading Optimizers',style:GoogleFonts.aboreto(
          fontSize:14,fontWeight:FontWeight.w600)
      ),

      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blueAccent.shade700),

      actions: [
        IconButton(
            splashColor: Colors.transparent,highlightColor: Colors.transparent,
            onPressed: () {
        },icon: Icon(FontAwesome.bell,size:17)),
      ],
    );
  }
}


