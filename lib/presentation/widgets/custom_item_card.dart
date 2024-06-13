import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/config.dart';
import 'package:widgets_app/domain/domain.dart';

class CustomItemCard extends StatelessWidget {
  final MenuItem item;
  const CustomItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return GestureDetector(
        onTap: () => context.push(item.link),
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(
              minHeight: 200, maxHeight: 200, minWidth: 200, maxWidth: 200),
          decoration: BoxDecoration(
              color: ThemeColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-5, 5), 
                  blurRadius: 8, 
                  color: Color(0xFF00060A), 
                ),
                BoxShadow(
                  offset: Offset(5, -5), 
                  blurRadius: 8, 
                  color: Color(0x1657E6C7), 
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: textStyle.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w200),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: item.icon,
              )
            ],
          ),
        ));
  }
}
