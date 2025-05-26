/*
* The main landing page
* */

import 'package:flutter/material.dart';
import 'package:projects/homepage/food_page_body.dart';
import 'package:projects/utils/colors.dart';
import 'package:projects/utils/dimensions.dart';
import 'package:projects/widgets/big_text.dart';
import 'package:projects/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    //print("Width" + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
                  padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(text: "Singapore", color: AppColors.mainColor, size: 30),
                          // 2nd row of the same column
                          Row(
                            children: [
                              SmallText(text: "Woodlands", color: Colors.black54,),
                              Icon(Icons.arrow_drop_down_rounded),
                            ],
                          )
                        ],
                      ),
                      // Creating a box for our search icon
                      Center(
                        child: Container(
                          width: Dimensions.width45,
                          height: Dimensions.height45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor,
                          ),
                          child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24),
                        ),
                      ),
                    ],
                  )
              )
          ),
          // We are creating a level of abstraction here,
          // The food page will handle the scrolling and interactions
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          ))
        ],
      )
    );
  }
}
