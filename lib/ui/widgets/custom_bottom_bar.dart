import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_rounded,
                size: 30,
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: color,
                child: CircleAvatar(radius: 5, backgroundColor: Colors.white),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_rounded,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
