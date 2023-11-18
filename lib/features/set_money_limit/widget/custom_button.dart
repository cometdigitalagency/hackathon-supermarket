import 'package:flutter/material.dart';
import 'package:save_mart/core/constants/theme/color.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  const CustomButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorConstants.mainColor,
        ),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        )),
      ),
    );
  }
}
