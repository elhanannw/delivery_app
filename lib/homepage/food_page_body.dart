/*
* Handles the interaction of the widgets in the food page
* */
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:projects/utils/colors.dart';
import 'package:projects/utils/dimensions.dart';
import 'package:projects/widgets/big_text.dart';
import 'package:projects/widgets/icon_and_text_widgets.dart';
import 'package:projects/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currPageVal = 0.0;
  double scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  // Handles the scrolling of the widget
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageVal = pageController.page!;
      });
    });
  }

  // ensure that the controller is disposed when not in use
  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // Where we call the scrolling page items
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),

        // For our scrolling dots
        DotsIndicator(
        dotsCount: 5,
        position: currPageVal,
        decorator: DotsDecorator(
          color: Colors.black87, // Inactive color
          activeColor: AppColors.mainColor,
          ),
        ),

        // Popular section title
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin:  const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin:  const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food Pairing", color: Colors.grey,),
              )
            ],
          ),
        ),

        // Displaying of popular items images
        ListView.builder(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        Container(
                          width: Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/image/food0.png"
                                  )
                              )
                          ),
                        ),
                        
                        //Text portion of popular items
                        Expanded(
                          child: Container(
                            height: Dimensions.listTextContainerSize,
                            decoration: BoxDecoration(borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20)
                               ),
                            color: Colors.white
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: "Yummy food for you to enjoy, made in Singapore"),
                                  SizedBox(height: Dimensions.height10,),
                                  SmallText(text: "With Singapore ingredients", color: Colors.grey,),
                                  SizedBox(height: Dimensions.height10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndTextWidgets(icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
                                      IconAndTextWidgets(icon: Icons.location_on, text: "2.3km", iconColor: AppColors.mainColor),
                                      IconAndTextWidgets(icon: Icons.access_time_rounded, text: "45min", iconColor: AppColors.iconColor2)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
            ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    // handles dynamic scrolling between the widget, helps with the scaling of the objects
    if (index == currPageVal.floor()) {
      var currScale = 1 - (currPageVal - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    } else if (index == currPageVal.floor() + 1) {
      var currScale = scaleFactor + (currPageVal - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    } else if (index == currPageVal.floor() - 1) {
      var currScale = 1 - (currPageVal - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,

      // Stacking the Boxes on top of each other to create the effect,
      // this is the first box
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(fit: BoxFit.cover,
                    image: AssetImage("assets/image/food0.png")
                )
            ),
          ),

          // this is the second box
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius:  5.0,
                      offset: Offset(0, 5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                    )
                  ]
              ),

              // This is inside the box, we creating a new container to put stuff in
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.width15, right: Dimensions.width15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Tikka Masala"),
                    SizedBox(height: Dimensions.height10,),

                    // 1st row of the container
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star,
                            color: AppColors.mainColor, size: 15,)),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5", color: AppColors.paraColor),
                        SizedBox(width: 10,),
                        SmallText(text: "1356", color: AppColors.paraColor),
                        SizedBox(width: 10,),
                        SmallText(text: "Comments", color: AppColors.paraColor)
                      ],
                    ),

                    // Accessing the 2nd row of the container
                    SizedBox(height: Dimensions.height20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidgets(icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
                        IconAndTextWidgets(icon: Icons.location_on, text: "2.3km", iconColor: AppColors.mainColor),
                        IconAndTextWidgets(icon: Icons.access_time_rounded, text: "45min", iconColor: AppColors.iconColor2)
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ) ;
  }
}
