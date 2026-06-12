import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String? hintText;
  final TextInputType? textInputType;
  final double? width;
  String? text;
  final IconData? suffixIcon;
  TextEditingController? controller;

   CustomTextField({super.key,
    required this.hintText,
     this.textInputType,
     this.width,
     this.text,
     this.suffixIcon,
     this.controller
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.text != null
            ? Text(widget.text!, style: TextStyle(fontSize: 18),)
            : SizedBox(),
        SizedBox(height: 10,),
        SizedBox(
          width: widget.width,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.textInputType,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon != null ? Icon(widget.suffixIcon!) : null,
              hintText: widget.hintText, hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        )
      ],
    );
  }
}
