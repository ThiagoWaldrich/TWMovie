import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Modified_Subtitle extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const Modified_Subtitle({
    Key? key,
    this.text = '',
    this.color = Colors.white,
    this.size = 16,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  text,
                  style: GoogleFonts.rubik(
                      color: color,
                      fontSize: size,
                      fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              height:25,
              width: 200,
              decoration: BoxDecoration(color: Colors.green.shade800,
              borderRadius: BorderRadius.circular(8)),
  
            ),
          );
  }
}
