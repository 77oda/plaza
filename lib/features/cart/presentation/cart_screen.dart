import 'package:flutter/material.dart';
import 'package:plaza/features/cart/presentation/widgets/cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: CartBody()));
  }
}
