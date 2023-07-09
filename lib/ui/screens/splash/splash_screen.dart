import 'package:flutter/material.dart';
import 'package:flutter_shoes_ui/ui/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        return Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (context, animation, _) {
            return FadeTransition(
              opacity: animation,
              child: const HomeScreen(),
            );
          },
        ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: size.height * 0.35,
            left: 0,
            right: 0,
            child: Column(
              children: [
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 1200),
                  tween: Tween<double>(begin: 1.0, end: 0.0),
                  curve: Curves.easeInOutBack,
                  builder: (context, value, _) {
                    return Transform.translate(
                      offset: Offset(0, -150.0 * value),
                      child: const Hero(
                        tag: 'logo',
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.white,
                          child: Image(
                            image: AssetImage('assets/shoes/adidas.png'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: 1000),
                  tween: Tween<double>(begin: 1.0, end: 0.0),
                  curve: Curves.easeInOutBack,
                  builder: (context, value, _) {
                    return Transform.translate(
                      offset: Offset(0, -150.0 * value),
                      child: const Text(
                        'SHOES SHOP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Text(
              '© MaicolDev',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
