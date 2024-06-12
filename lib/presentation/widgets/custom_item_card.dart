import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/domain/domain.dart';

class CustomItemCard extends StatelessWidget {
  // es requerido el menuitem para poder usar este widget
  final MenuItem item;
  const CustomItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
        onTap: () => context.push(item.link),
        child: Container(
          margin: const EdgeInsets.all(10),
          constraints: const BoxConstraints(
              minHeight: 200, maxHeight: 200, minWidth: 200, maxWidth: 200),
          decoration: containerDecoration(colors),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(item.title,
              style: textStyle.titleLarge?.copyWith(
                fontWeight: FontWeight.w200
              ),),

              const SizedBox(height: 20,),

              Text(item.subTitle,
              textAlign: TextAlign.center,
              style: textStyle.bodyLarge?.copyWith(
                fontWeight: FontWeight.w200,
              ),),

              const SizedBox(height: 20,),
              item.icon
            ],
          ),
        ));
  }

  
}

// Decoracion del container
// metodo separado para mejorar la visibilidad del codigo

BoxDecoration containerDecoration(ColorScheme colors) {
    return BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow:  [
            BoxShadow(
              blurRadius: 3,
              offset: const Offset(1, 1),
              color: colors.onBackground
            ),
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(-1, -1),
              color: colors.background
            ),
          ]
        );
  }