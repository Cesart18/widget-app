import 'package:flutter/material.dart';
import 'package:widgets_app/config/constants/app_menu_items.dart';
import 'package:widgets_app/presentation/presentation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets App'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              ...ConstantsItems.appMenuItems.map((item) => CustomItemCard(item: item))
            ],
          ),
        )),
    );
  }
}


