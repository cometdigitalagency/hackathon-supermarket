import 'package:flutter/material.dart';
import 'package:save_mart/core/constants/theme/color.dart';

class CustomChoiceBox extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final IconData icon;
  const CustomChoiceBox(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Column(
            children: [
              Icon(
                icon,
                size: 68,
                color: ColorConstants.mainColor,
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
