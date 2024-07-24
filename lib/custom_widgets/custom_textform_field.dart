import 'package:doctor_app/common/libraries.dart';
import 'package:flutter/services.dart';
class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;

  const CustomTextFormField(
      {super.key,
      this.hintText = "Hint Text",
      this.textController,
      this.validator,
      this.keyboardType =TextInputType.name,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(
        color: const Color(0xff000000),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      maxLines: maxLines,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      controller: textController,
      validator: validator,
      decoration: InputDecoration(
        fillColor: greyColor,
        filled: true,
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xff000000),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: greyColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greyColor),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greyColor),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
