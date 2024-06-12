import 'package:flutter/material.dart';
import 'package:widgets_app/config/constants/app_menu_items.dart';

class ProgressBarScreen extends StatelessWidget {
  const ProgressBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screen')
      ),
      body: const Center(
        child: Hero(tag: progressHeroTag, child:  CircularProgressIndicator()),
      ),
    );
  }
}