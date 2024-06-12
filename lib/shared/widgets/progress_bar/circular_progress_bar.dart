import 'dart:math';
import 'package:flutter/material.dart';

/// Este widget representa una barra de progreso radial personalizada que muestra una pista circular con un arco de color que indica el progreso.
///
/// Se puede utilizar para representar visualmente el progreso de una tarea u operación.
class CircularProgressBar extends StatefulWidget {
  
  final double size;
  // El tamaño de la barra de progreso. Predeterminado: 100
  final double percentage;
  // El porcentaje de la barra de progreso. Predeterminado: 50
  final Color backgroundColor;
  /// El color de fondo de la pista circular.

  final Color percentageColor;
  /// El color del arco de progreso.

  final double strokeWidth;
  /// el grosor de la barra de progreso. Predeterminado = 5

   const CircularProgressBar({
    super.key, this.size = 100,
     this.percentage = 50,
      this.backgroundColor = Colors.black12,
        this.percentageColor = Colors.red,
        this.strokeWidth = 5
        });

  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar> with SingleTickerProviderStateMixin{

   late AnimationController _controller;
  late double lastPercentage ;
  double newPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    lastPercentage = widget.percentage;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward( from: 0.0 );
    final textStyle = Theme.of(context).textTheme;

    final diference = widget.percentage - lastPercentage;
    lastPercentage = widget.percentage;

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
                return SizedBox(
              width: widget.size,
              height: widget.size,
              child: CustomPaint(
                painter: _RadialProgressBar(
                   percentage: ( widget.percentage - diference ) + ( diference * _controller.value ),
                   backgroundColor: widget.backgroundColor,
                   percentageColor: widget.percentageColor,
                   strokeWidth: widget.strokeWidth
                   ),
              ),
            );
            },
          ),
        ),
         Align(
          alignment: Alignment.center,
          child: Text('${widget.percentage}%',
          style: textStyle.bodyMedium,))
      ],
    );
  }
}


class _RadialProgressBar extends CustomPainter{

  final double percentage;
  final Color backgroundColor;
  final Color percentageColor;
  final double strokeWidth;
  _RadialProgressBar({ required this.percentage, required this.backgroundColor, required this.percentageColor, required this.strokeWidth,});


  

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
    ..color = backgroundColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth;

    final center = Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);
    // Dibuja el círculo de fondo
    canvas.drawCircle(center, radio, paint);


  final paintArco = Paint()
      ..color = percentageColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double arcAngle = 2 * pi * (percentage / 100);
// Dibuja el arco de progreso
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radio),
        -pi / 2,
        arcAngle,
        false,
        paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}