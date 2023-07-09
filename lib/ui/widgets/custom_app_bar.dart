import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Image(
                      image: AssetImage('assets/shoes/adidas.png'),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'ADIDAS',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    ),
                    const Positioned(
                      top: 4,
                      right: 4,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.pinkAccent,
                        child: Text(
                          '0',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
