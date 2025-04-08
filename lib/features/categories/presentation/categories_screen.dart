import 'package:flutter/material.dart';
import 'package:plaza/features/categories/presentation/widgets/categories_body.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: CategoriesBody()));
  }
}
