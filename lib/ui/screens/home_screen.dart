import 'package:flutter/material.dart';
import 'package:flutter_shoes_ui/models/data.dart';
import 'package:flutter_shoes_ui/models/shoes.dart';
import 'package:flutter_shoes_ui/ui/widgets/custom_app_bar.dart';
import 'package:flutter_shoes_ui/ui/widgets/custom_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(viewportFraction: 0.75);

  double _currentPage = 0.0;
  double indexPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
      if (_currentPage >= 0 && _currentPage < 0.7) {
        indexPage = 0;
      } else if (_currentPage > 0.7 && _currentPage < 1.7) {
        indexPage = 1;
      } else if (_currentPage > 1.7 && _currentPage < 2.7) {
        indexPage = 2;
      }
    });
  }

  Color getColor() {
    late final Color color;
    if (_currentPage >= 0 && _currentPage < 0.7) {
      color = listShoes[0].listImage[0].color;
    } else if (_currentPage > 0.7 && _currentPage < 1.7) {
      color = listShoes[1].listImage[0].color;
    } else if (_currentPage > 1.7 && _currentPage < 2.7) {
      color = listShoes[2].listImage[0].color;
    }
    return color;
  }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: List.generate(
                  listCategory.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      listCategory[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.0,
                        color: index == indexPage ? getColor() : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: listShoes.length,
              itemBuilder: (context, index) {
                final shoes = listShoes[index];
                final listTitle = shoes.category.split(' ');
                return Padding(
                  padding:
                      EdgeInsets.only(right: index == indexPage ? 30.0 : 60.0),
                  child: Transform.translate(
                    offset: Offset(index == indexPage ? 0 : 20, 0),
                    child: LayoutBuilder(builder: (context, constrains) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        margin: EdgeInsets.only(
                            top: index == indexPage ? 30 : 50, bottom: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: Colors.white,
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 40,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    shoes.category,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    shoes.name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    shoes.price,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  FittedBox(
                                    child: Text(
                                      '${listTitle[0]}\n${listTitle[1]}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: constrains.maxHeight * 0.2,
                              left: constrains.maxWidth * 0.05,
                              right: -constrains.maxWidth * 0.16,
                              bottom: constrains.maxHeight * 0.2,
                              child: Image(
                                image: AssetImage(shoes.listImage[0].image),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Material(
                                color: shoes.listImage[0].color,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(36),
                                    bottomRight: Radius.circular(36)),
                                child: InkWell(
                                  onTap: () {},
                                  child: const SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Icon(
                                      Icons.add,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            child: CustomBottomBar(color: getColor()),
          )
        ],
      ),
    );
  }
}
