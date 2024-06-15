


  import 'package:widgets_app/domain/domain.dart';

class FirstQuestions {

    static const List<Question> firstQuestions = [
      Question(
        question: '¿Cual es la capital de Guarico?',
         options: [
          'Ortiz',
          'San Juan de los morros',
          'Valle de la pascua',
         ],
          correctAnswer: 1),
      Question(
        question: '¿Cual es la capital de Merida?',
         options: [
          'Merida',
          'Mucuchies',
          'Tovar'
         ],
          correctAnswer: 0),
      Question(
        question: '¿Cual es la capital de Carabobo?',
         options: [
          'San diego',
          'Puerto Cabello'
          'Valencia',
         ],
          correctAnswer: 2),
      Question(
        question: '¿Cual es la capital de Aragua?',
         options: [
          'Palo Negro',
          'Maracay',
          'Cuyagua'
         ],
          correctAnswer: 1),
      Question(
        question: '¿Cual es la capital de Amazonas?',
         options: [
          'Puerto Ayacucho',
          'San Fernando de Atabapo',
          'La Esmeralda'
         ],
          correctAnswer: 0),
    ];

  }
