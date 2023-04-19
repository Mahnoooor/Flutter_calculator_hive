import 'dart:ui';

import 'package:calculator/provider/calculator_provider.dart';
import 'package:calculator/imports.dart';
import 'package:calculator/screens/history.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(
        
        context,
        '',
        Icons.history_toggle_off_rounded,
        () {
          Get.to(History());
        },
      ),
      body: Column(
        children: [
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * .3,
            padding: EdgeInsets.symmetric(
              vertical: mediaQuery.width * 0.08,
              horizontal: mediaQuery.width * 0.06,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 20.0,
                  child: ListView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Consumer<CalculatorProvider>(
                        builder: (context, equation, child) => Text(
                          equation.equation,
style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20.sp),
                          
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Consumer<CalculatorProvider>(
                  builder: (context, equation, child) => Text(
                    equation.result,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 28.sp),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(18.sp),
      topRight: Radius.circular(18.sp),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 5.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, -2.0),
      ),
    ],
  ),
              width: double.infinity,
              
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(15.sp),
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.1,
                mainAxisSpacing: 3.0,
                crossAxisCount: 4,
                children: buttons,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
