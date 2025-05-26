/*
 * In-charge of creating dynamic dimensions based on mobile size
 * */

import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.85;
  static double pageViewContainer = screenHeight / 4.15;
  static double pageViewTextContainer = screenHeight / 7.61;
  
  static double height10 = screenHeight / 91.4;
  static double height15 = screenHeight / 60.93;
  static double height20 = screenHeight / 45.7;
  static double height30 = screenHeight / 30.46;
  static double height45 = screenHeight / 20.31;

  static double width10 = screenWidth / 41.1;
  static double width15 = screenWidth / 27.4;
  static double width20 = screenWidth / 20.55;
  static double width30 = screenWidth / 13.7;
  static double width45 = screenWidth / 9.13;

  static double font20 = screenHeight / 45.7;
  static double radius15 = screenHeight / 60.93;
  static double radius20 = screenHeight / 45.7;
  static double radius30 = screenHeight / 30.46;

  static double iconSize24 = screenHeight / 38.08;

  static double listViewImgSize = screenWidth / 3.42;
  static double listTextContainerSize = screenWidth / 4.11;



}