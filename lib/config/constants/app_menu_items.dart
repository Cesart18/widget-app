import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgets_app/domain/domain.dart';
import 'package:widgets_app/presentation/presentation.dart';



class ConstantsItems {

// estos son los heros tags usados en las animaciones hero para cada uno de los elementos
  static const progressHeroTag = 'progress-bar';
  static const educationHeroTag = 'education-card';
  static const quizHeroTag = 'quiz-card';

// items de la pagina de navegacion
  static final appMenuItems = <MenuItem>[
  const MenuItem(
      title: 'Barra de progreso',
      link: '/progress-bar',
      icon:  Hero(tag: progressHeroTag, child: CustomCircularProgressBar()),
      ),
  MenuItem(
      title: 'Tarjeta educativa',
      link: '/education-card',
      icon:  Padding(
        padding: const EdgeInsets.all(20),
        child: Hero(tag: educationHeroTag, child: SvgPicture.asset('assets/svgs/educador.svg')),
      ),
      ),
   MenuItem(
      title: 'Quiz',
      link: '/quiz',
      icon:  Hero(tag: quizHeroTag, child: SvgPicture.asset('assets/svgs/reloj.svg')),
      ),
];

}





