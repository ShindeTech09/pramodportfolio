import 'package:flutter/material.dart';

class FormTextBox extends StatelessWidget {
  const FormTextBox({
    super.key,
    required TextEditingController controller,
    required this.screenWidth,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
  }) : _controller = controller;

  final TextEditingController _controller;
  final double screenWidth;
  final String labelText, hintText;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,

      controller: _controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize:
              screenWidth > 1024
                  ? 20
                  : screenWidth > 768
                  ? 18
                  : 16,
          color: Colors.grey[300],
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize:
              screenWidth > 1024
                  ? 18
                  : screenWidth > 768
                  ? 16
                  : 14,
          color: Colors.grey[500],
        ),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[700]!, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal:
              screenWidth > 1024
                  ? 20
                  : screenWidth > 768
                  ? 16
                  : 12,
          vertical:
              screenWidth > 1024
                  ? 16
                  : screenWidth > 768
                  ? 14
                  : 10,
        ),
      ),
      validator: validator,
      style: TextStyle(
        fontSize:
            screenWidth > 1024
                ? 18
                : screenWidth > 768
                ? 16
                : 14,
        color: Colors.white,
      ),
    );
  }
}
