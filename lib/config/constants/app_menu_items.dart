import 'package:flutter/material.dart';
import 'package:widgets_app/domain/domain.dart';

// items de la pagina de navegacion

// estos son los heros tags usados en las animaciones hero para cada uno de los elementos
const progressHeroTag = 'progress-bar';

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Progress Bar',
      subTitle: 'Barra de progreso animada',
      link: '/progress-bar',
      icon:  Hero(tag: progressHeroTag, child:  CircularProgressIndicator())),
  
];



