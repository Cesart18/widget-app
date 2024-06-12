import 'package:flutter/material.dart';
import 'package:widgets_app/domain/domain.dart';
import 'package:widgets_app/presentation/presentation.dart';

// items de la pagina de navegacion

// estos son los heros tags usados en las animaciones hero para cada uno de los elementos



class ConstantsItems {

  static const progressHeroTag = 'progress-bar';

  static const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Barra de progreso',
      link: '/progress-bar',
      icon:  Hero(tag: progressHeroTag, child: CustomCircularProgressBar())),
  
];

  

}





