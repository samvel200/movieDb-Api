import 'dart:math';

import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
     
        child:RadealPercentWidget(
          percent: 0.72,
          fillColor: Colors.blue,
          lineColor: Colors.red,
          freeColor: Colors.yellow,
          lineWidth: 5,
          child: Text('79%', style: TextStyle(color: Colors.white),),)
      ),
    );
  }
}



class RadealPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;






  const RadealPercentWidget({
    super.key,
     required this.child,
     required this.percent,
     required this.fillColor,
     required this.lineColor,
     required this.freeColor,
     required this.lineWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(painter: MyPainter(
          percent: percent,
          fillColor: fillColor,
          lineColor: lineColor,
          freeColor: freeColor,
          lineWidth: lineWidth,
           child: child,
        )),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Center(child: child),
        )
      ],
    );
  }
}

class MyPainter extends CustomPainter{
 final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({super.repaint,
   required this.child,
   required this.percent,
   required this.fillColor,
   required this.lineColor,
   required this.freeColor, 
   required this.lineWidth
       });

  @override
  void paint(Canvas canvas, Size size) {
    final backgraundPaint = Paint();
    backgraundPaint.color = fillColor;
    backgraundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgraundPaint);

    ///////////////////////

  
  final freedPaint = Paint();
    freedPaint.color = freeColor;
    freedPaint.style = PaintingStyle.stroke;
    freedPaint.strokeWidth = lineWidth;
   canvas.drawArc(
    Offset(5.5,5.5) & Size(size.width - 11, size.height - 11),
      pi * 2 * percent - (pi / 2),
    pi * 2 * (1.0 - percent),
    false,
    freedPaint);
  

  ///////////////////


    final feelPaint = Paint();
    feelPaint.color = lineColor;
    feelPaint.style = PaintingStyle.stroke;
    feelPaint.strokeWidth = lineWidth;
    feelPaint.strokeCap = StrokeCap.round;
   canvas.drawArc(
    Offset(5.5,5.5) & Size(size.width - 11, size.height - 11),
     -pi / 2,
    pi * 2 * percent,
    false,
    feelPaint);





  



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  

  

}

