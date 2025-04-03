import 'package:flutter/material.dart';
import 'package:plaza/features/onboarding/data/model/Boarding_model.dart';
import 'package:plaza/features/onboarding/presentation/widgets/onbiarding_page_view_item.dart';

// ignore: must_be_immutable
class OnboardingPageView extends StatelessWidget {
  PageController onBoardController;
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

  OnboardingPageView({super.key, required this.onBoardController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: onBoardController,
        physics: const BouncingScrollPhysics(),
        itemBuilder:
            (context, index) => onBoardingPageViewItem(boardingModel[index]),
        itemCount: 3,
      ),
    );
  }
}
