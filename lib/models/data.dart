import 'package:flutter/material.dart';
import 'package:flutter_shoes_ui/models/shoes.dart';

final listCategory = ['Running', 'Sneakers', 'Footwear'];

final listShoes = [
  Shoes(
    'DURAMO SL 2.0',
    'ADIDAS RUNNING',
    '\$95.00',
    4,
    [
      ImageShoes(
        'assets/shoes/K_03.png',
        const Color.fromARGB(255, 240, 60, 64),
      ),
      ImageShoes(
        'assets/shoes/K_01.png',
        const Color.fromARGB(255, 143, 157, 170),
      ),
      ImageShoes(
        'assets/shoes/K_02.png',
        Color.fromARGB(255, 35, 38, 136),
      ),
      ImageShoes(
        'assets/shoes/K_04.png',
        Color.fromARGB(255, 5, 5, 5),
      ),
    ],
  ),
  Shoes(
    'BOUNCE LEGEND',
    'ADIDAS SNEAKER',
    '\$105.00',
    4,
    [
      ImageShoes(
        'assets/shoes/M_01.png',
        Color.fromARGB(255, 170, 170, 154),
      ),
      ImageShoes(
        'assets/shoes/M_02.png',
        const Color.fromARGB(255, 163, 203, 202),
      ),
      ImageShoes(
        'assets/shoes/M_03.png',
        Color.fromARGB(255, 5, 5, 5),
      ),
    ],
  ),
  Shoes(
    'OZWEEGO ORIGINAL',
    'ADIDAS FOOTWEAR',
    '\$120.00',
    4,
    [
      ImageShoes(
        'assets/shoes/L_01.png',
        Color.fromARGB(255, 15, 17, 94),
      ),
      ImageShoes(
        'assets/shoes/L_02.png',
        const Color.fromARGB(255, 143, 83, 85),
      ),
      ImageShoes(
        'assets/shoes/L_03.png',
        const Color.fromARGB(255, 166, 121, 98),
      ),
      ImageShoes(
        'assets/shoes/L_04.png',
        const Color.fromARGB(255, 120, 126, 116),
      ),
    ],
  ),
];
