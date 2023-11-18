import 'package:flutter/material.dart';

class CustomProductCartList extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() onPressed;
  const CustomProductCartList(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ],
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
