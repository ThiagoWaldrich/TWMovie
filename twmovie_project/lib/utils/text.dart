import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Modified_Text extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const Modified_Text({Key? key, this.text = '',  this.color=Colors.white,  this.size = 18}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text, style:GoogleFonts.rubik(
        color: color, fontSize: size
      ),
    );
  }
}