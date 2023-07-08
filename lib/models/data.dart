import 'package:flutter/material.dart';
import 'package:flutter_shoes_ui/models/shoes.dart';

final listCategory = ['Backetball', 'Running', 'Traning'];

final listShoes = [
  Shoes(
    'AIR JORDAN 1 MID SE GC',
    'KINE AIR',
    '\$120.00',
    4,
    [
      ImageShoes(
        'assets/shoes/K_01.png',
        const Color(0xffEAA906),
      ),
      ImageShoes(
        'assets/shoes/K_02.png',
        const Color(0xff088894),
      ),
      ImageShoes(
        'assets/shoes/K_03.png',
        const Color(0xffB50D0D),
      ),
      ImageShoes(
        'assets/shoes/K_04.png',
        const Color(0xff229954),
      ),
    ],
  ),
  Shoes(
    'NIKE BLAZER MID',
    'NIKE AIR',
    '\$150.00',
    4,
    [
      ImageShoes(
        'assets/shoes/M_01.png',
        const Color(0xff08B894),
      ),
      ImageShoes(
        'assets/shoes/M_02.png',
        const Color(0xffE90311),
      ),
      ImageShoes(
        'assets/shoes/M_03.png',
        const Color(0xff189E03),
      ),
    ],
  ),
  Shoes(
    'ZoomX VaporFly',
    'NIKE ZOOM',
    '\$180.00',
    4,
    [
      ImageShoes(
        'assets/shoes/L_01.png',
        const Color(0xff7B7A41),
      ),
      ImageShoes(
        'assets/shoes/L_02.png',
        const Color(0xff2C2C46),
      ),
      ImageShoes(
        'assets/shoes/L_03.png',
        const Color(0xff262626),
      ),
      ImageShoes(
        'assets/shoes/L_04.png',
        const Color(0xff5C9462),
      ),
    ],
  ),
];
