import 'package:flutter/material.dart';

class CustomProductCartList extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final Function() onPressed;
  final int quantity;
  const CustomProductCartList({
    super.key,
    required this.title,
    required this.price,
    required this.onPressed,
    required this.image,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  // child: Image.network(image),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
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
                      price,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "x ${quantity.toString()}",
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
