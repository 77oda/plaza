import 'package:flutter/material.dart';
import 'package:plaza/features/onboarding/data/model/Boarding_model.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onbiarding_page_view_item.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onboarding_body.dart';

class OnboardingPageView extends StatelessWidget {
  PageController onBoardController;
  // late bool isLast;
  List<BoardingModel> boardingModel = [
    BoardingModel(
      image: 'assets/images/OnlineShop.png',
      body:
          'Choose Whatever the Product you wish for with the easiest way possible using ShopMart',
      title: 'Explore',
    ),
    BoardingModel(
      image: 'assets/images/Delivery.png',
      body:
          'Yor Order will be shipped to you as fast as possible by our carrier',
      title: 'Shipping',
    ),
    BoardingModel(
      image: 'assets/images/Payment.png',
      body: 'Pay with the safest way possible either by cash or credit cards',
      title: 'Make the Payment',
    ),
  ];

  OnboardingPageView({
    super.key,
    required this.onBoardController,
    // required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: onBoardController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (index) {
          if (index == boardingModel.length - 1) {
            isLast = true;
          } else {
            isLast = false;
          }
        },
        itemBuilder:
            (context, index) => onBoardingPageViewItem(boardingModel[index]),
        itemCount: 3,
      ),
    );
  }
}
