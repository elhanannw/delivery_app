import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/utils/colors.dart';
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

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageVal = pageController.page!;
        print("Current value is " + currPageVal.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: PageView.builder(
        controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
        return _buildPageItem(position);
      }),
    );
  }
  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png")
              )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Tikka Masala"),
                  SizedBox(height: 10,),
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
                  SizedBox(height: 20,),
                  Row(
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
    ) ;
  }
}
