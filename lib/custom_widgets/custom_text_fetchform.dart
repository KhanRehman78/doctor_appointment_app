
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomTextFetchForm extends StatelessWidget {
  final String? tittle;
  final Color? myColor;
  final double? size;
  final FontWeight? fontWeight;
  void Function()? onTap;

  CustomTextFetchForm(
      {super.key,
        this.onTap,
        this.tittle = "Tittle",
        this.myColor = Colors.black,
        this.size = 14,
        this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Text(
        tittle!,
        style: GoogleFonts.poppins(
          color: myColor,
          fontSize: size,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
