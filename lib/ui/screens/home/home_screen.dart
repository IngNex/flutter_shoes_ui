import 'package:flutter/material.dart';
import 'package:flutter_shoes_ui/models/data.dart';
import 'package:flutter_shoes_ui/ui/screens/details/details_shoes.dart';
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
          CustomAppBar(),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  listCategory.length,
                  (index) => Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index == indexPage ? getColor() : Colors.white,
                      ),
                      child: Text(
                        listCategory[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16.0,
                          color:
                              index == indexPage ? Colors.white : Colors.black,
                        ),
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
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 650),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 650),
                        pageBuilder: (context, animation, _) {
                          return FadeTransition(
                            opacity: animation,
                            child: DetailsShoes(shoes: shoes),
                          );
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: index == indexPage ? 30.0 : 60.0),
                    child: Transform.translate(
                      offset: Offset(index == indexPage ? 0 : 20, 0),
                      child: LayoutBuilder(builder: (context, constrains) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: EdgeInsets.only(
                              top: index == indexPage ? 40 : 80,
                              bottom: index == indexPage ? 40 : 80),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            color: Colors.white,
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 25.0,
                                  horizontal: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      listTitle[1],
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      shoes.name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      shoes.price,
                                      style: TextStyle(
                                        color: shoes.listImage[0].color,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    FittedBox(
                                      child: Text(
                                        '${listTitle[0]}\n${listTitle[1]}',
                                        style: TextStyle(
                                          color: Colors.grey.withOpacity(0.6),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: constrains.maxHeight * 0.4,
                                left: -constrains.maxWidth * 0.2,
                                right: -constrains.maxWidth * 0.2,
                                bottom: -constrains.maxHeight * 0.02,
                                child: Hero(
                                  tag: shoes.name,
                                  child: Image(
                                    image: AssetImage(shoes.listImage[0].image),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(36),
                                      bottomRight: Radius.circular(36),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: shoes.listImage[0].color,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(36),
                                          bottomRight: Radius.circular(36),
                                        ),
                                        border: Border.all(
                                            color: Colors.grey, width: 2),
                                      ),
                                      child: InkWell(
                                        onTap: () {},
                                        child: const SizedBox(
                                          height: 80,
                                          width: 80,
                                          child: Icon(
                                            Icons.add_shopping_cart_outlined,
                                            size: 40,
                                          ),
                                        ),
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
                  ),
                );
              },
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(20),
            child: CustomBottomBar(color: getColor()),
          ),
        ],
      ),
    );
  }
}
