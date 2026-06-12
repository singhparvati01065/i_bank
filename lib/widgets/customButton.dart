import 'package:flutter/material.dart';
import 'package:i_bank/constants/color_constants.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function()? onTap;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.width = 380,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: 55,
        decoration: BoxDecoration(
          color: ColorConstants.primary1,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(child: Text(widget.text,style: TextStyle(color: Colors.white, fontSize: 20),)),
      ),
    );
  }
}
