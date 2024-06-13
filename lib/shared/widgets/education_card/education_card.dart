
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Un widget que muestra una tarjeta educativa con una imagen de fondo, título,
/// subtítulo y una barra de progreso que indica un porcentaje de finalización.
class EducationCard extends StatelessWidget {
  final Color borderColor;
  final Color labelColor;
  final Color progressPrimaryColor;
  final Color progressPercentageColor;
  final Color? backgroundColor;
  final Widget backgroundImage;
  final Widget labelTitle;
  final Widget labelSubtitle;
  final double percentage;
  final Function()? onTap;

  /// Crea una [EducationCard].
  /// 
  /// Los parámetros [backgroundImage], [labelTitle], [labelSubtitle] y [percentage] son obligatorios.
  /// El [percentage] debe estar entre 0 y 100.
  const EducationCard({
    super.key,
    required this.backgroundImage,
    required this.labelTitle,
    required this.labelSubtitle,
    required this.percentage,
    this.borderColor = Colors.white,
    this.labelColor = Colors.white,
    this.progressPrimaryColor = Colors.black45,
    this.progressPercentageColor = Colors.red,
    this.onTap,
    this.backgroundColor
  }) : assert(percentage >= 0, 'El porcentaje debe ser mayor o igual a 0'),
       assert(percentage <= 100, 'El porcentaje debe ser menor o igual a 100');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: const BoxConstraints(
          minWidth: 250,
          minHeight: 300,
          maxWidth: 300,
          maxHeight: 400,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor
        ),
        child: Stack(
          children: [
            // Sección de imagen de fondo
            backgroundImage,
            if( percentage == 100 ) 
             Positioned(
              top: 5,
              right: 10,
              child: Icon(Icons.check_circle_outline_rounded, color: Colors.greenAccent.shade700,)),
      
            // Sección de etiqueta y barra de progreso
            Align(
              alignment: Alignment.bottomCenter,
              child: _CardLabel(
                labelColor: labelColor,
                labelTitle: labelTitle,
                labelSubtitle: labelSubtitle,
                percentage: percentage,
                percentageColor: progressPercentageColor,
                primaryColor: progressPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Un widget que muestra la sección de etiquetas de la [EducationCard],
/// que incluye un título, subtítulo y una barra de progreso.
class _CardLabel extends StatelessWidget {
  final Color labelColor;
  final Color primaryColor;
  final Color percentageColor;
  final double percentage;
  final Widget labelTitle;
  final Widget labelSubtitle;

  /// Crea un [_CardLabel].
  /// 
  /// Los parámetros [labelColor], [labelTitle], [labelSubtitle], [primaryColor], 
  /// [percentageColor] y [percentage] son obligatorios.
  const _CardLabel({
    required this.labelColor,
    required this.labelTitle,
    required this.labelSubtitle,
    required this.primaryColor,
    required this.percentageColor,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        constraints: const BoxConstraints(
          maxHeight: 100,
        ),
        decoration: BoxDecoration(
          color: labelColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            // Título
            labelTitle,
            const SizedBox(height: 2,),
            // Subtítulo
            labelSubtitle,
            const SizedBox(height: 5,),
            
            // Barra de progreso
            Expanded(
              child: _ProgressBar(
                percentage: percentage,
                percentageColor: percentageColor,
                primaryColor: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/// Un widget que muestra una barra de progreso con un porcentaje.
class _ProgressBar extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color percentageColor;

  /// Crea un [_ProgressBar].
  /// 
  /// Los parámetros [percentage], [percentageColor] y [primaryColor] son obligatorios.
  const _ProgressBar({
    required this.percentage,
    required this.percentageColor,
    required this.primaryColor,
  });

  @override
  State<_ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<_ProgressBar> with TickerProviderStateMixin {

  late AnimationController _progressController;
  late AnimationController _scaleController;
  late double lastPercentage;
  late Animation<double> scale;
  double newPercentage = 0.0;

 

    @override
  void initState() {
    super.initState();
    _progressController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    lastPercentage = widget.percentage;

    _scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    scale = Tween(begin: 1.0, end: 1.3)
        .animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut));

    _scaleController.addListener(() { 
      if ( _scaleController.status == AnimationStatus.completed ){
        _scaleController.reverse();
      }
    });
  }


  @override
  void dispose() {
    _progressController.dispose();
    _scaleController.dispose();
    super.dispose();
  }
  


  @override
  Widget build(BuildContext context) {

    if( widget.percentage == 100 ) _scaleController.forward();

    _progressController.forward(from: 0.0);
    final difference = widget.percentage - lastPercentage;
    lastPercentage = widget.percentage;
    return Container(
      width: double.infinity,
      height: double.infinity,
      constraints: const BoxConstraints(
        maxHeight: 35
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          // icono bandera
          Icon(
            Icons.flag_circle,
            color: (widget.percentage == 0) ? Colors.grey.shade400 : widget.percentageColor,
          ),
          const SizedBox(width: 5),
          // barra de progreso
          AnimatedBuilder(
            animation: _progressController,
             builder: (context, child) {
                return Expanded(
            child: CustomPaint(
              painter: _LinearProgressBar(
                percentage: (widget.percentage - difference) + (difference * _progressController.value),
                percentageColor: widget.percentageColor,
                primaryColor: widget.primaryColor,
              ),
            ),
          );
             },),

        // icono estrella
          const SizedBox(width: 5),
          AnimatedBuilder(
            animation: _scaleController,
             builder: (context, child) {
              return Transform.scale(
                scale: scale.value,
                child: Icon(
                Icons.stars_rounded,
                color: (widget.percentage < 100) ? Colors.grey.shade400 : widget.percentageColor,
                            ),
              );
             },)
         

        ],
      ),
    );
  }
}





/// Un painter personalizado para dibujar la barra de progreso lineal.
class _LinearProgressBar extends CustomPainter {
  final Color primaryColor;
  final Color percentageColor;
  final double percentage;

  /// Crea un [_LinearProgressBar].
  /// 
  /// Los parámetros [primaryColor], [percentageColor] y [percentage] son obligatorios.
  _LinearProgressBar({
    required this.primaryColor,
    required this.percentageColor,
    required this.percentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Pintura de fondo de la barra de progreso
    final bgPaint = Paint()
      ..color = primaryColor
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const begin = Offset(0, 0);
    final finalLine = Offset(size.width, 0);

    canvas.drawLine(begin, finalLine, bgPaint);

    // Pintura de progreso de la barra
    final progressLine = Offset(size.width * (percentage / 100), 0);

    final progressPaint = Paint()
      ..color = percentageColor
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = (percentage == 0) ? StrokeCap.butt : StrokeCap.round;

    canvas.drawLine(begin, progressLine, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
