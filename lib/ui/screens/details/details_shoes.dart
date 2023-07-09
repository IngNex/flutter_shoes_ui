import 'package:flutter/material.dart';
import 'package:flutter_shoes_ui/models/shoes.dart';
import 'package:flutter_shoes_ui/ui/widgets/custom_botton.dart';
import 'package:flutter_shoes_ui/ui/widgets/transition.dart';

class DetailsShoes extends StatefulWidget {
  const DetailsShoes({super.key, required this.shoes});

  final Shoes shoes;

  @override
  State<DetailsShoes> createState() => _DetailsShoesState();
}

class _DetailsShoesState extends State<DetailsShoes> {
  int valueIndexColor = 0;
  int valueIndexSize = 1;

  double sizeShoes(int index, Size size) {
    switch (index) {
      case 0:
        return (size.height * 0.09);
      case 1:
        return (size.height * 0.07);
      case 2:
        return (size.height * 0.05);
      case 3:
        return (size.height * 0.04);
      default:
        return (size.height * 0.05);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final listTitle = widget.shoes.category.split(' ');
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -size.height * 0.15,
            right: -size.height * 0.20,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 250),
              tween: Tween(begin: 0, end: 1),
              builder: (context, value, _) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: value * size.height * 0.40,
                  width: value * size.height * 0.40,
                  decoration: BoxDecoration(
                    color: widget.shoes.listImage[valueIndexColor].color,
                    shape: BoxShape.circle,
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: kToolbarHeight,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor:
                      widget.shoes.listImage[valueIndexColor].color,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: widget.shoes.listImage[valueIndexColor].color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.2,
            right: 10,
            left: 10,
            child: FittedBox(
              child: Text(
                '${listTitle[0]}\n${listTitle[1]}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            top: size.height * 0.22,
            right: sizeShoes(valueIndexSize, size),
            left: sizeShoes(valueIndexSize, size),
            child: Hero(
              tag: widget.shoes.name,
              child: Image(
                image:
                    AssetImage(widget.shoes.listImage[valueIndexColor].image),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.62,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ShakeTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.shoes.category,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.shoes.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: widget
                                    .shoes.listImage[valueIndexColor].color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ShakeTransition(
                        left: false,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: widget.shoes.punctuation > index
                                  ? widget
                                      .shoes.listImage[valueIndexColor].color
                                  : Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ShakeTransition(
                    child: Text(
                      widget.shoes.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShakeTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'COLOR',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(
                                widget.shoes.listImage.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    valueIndexColor = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8.0),
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color:
                                          widget.shoes.listImage[index].color,
                                      shape: BoxShape.circle,
                                      border: index == valueIndexColor
                                          ? Border.all(
                                              color: Colors.grey,
                                              width: 2,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ShakeTransition(
                        left: false,
                        child: CustomButton(
                          onTap: () {},
                          color: widget.shoes.listImage[valueIndexColor].color,
                          width: 100,
                          child: const Text(
                            'BUY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ShakeTransition(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SIZE',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: CustomButton(
                                onTap: () {
                                  valueIndexSize = index;
                                  setState(() {});
                                },
                                color: index == valueIndexSize
                                    ? widget
                                        .shoes.listImage[valueIndexColor].color
                                    : Colors.grey.withOpacity(0.3),
                                child: Text(
                                  '${index + 7}\'',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: index == valueIndexSize
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
