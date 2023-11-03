import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 1, end: 10).animate(animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            animationController.forward();
            animationController.addListener(() {
              if (animationController.isCompleted) {
                Navigator.of(context)
                    .push(MyCustomTransitionClass(route: const Destination()));
                Timer(
                  const Duration(milliseconds: 500),
                  () => animationController.reset(),
                );
              }
            });
          },
          child: ScaleTransition(
            scale: animation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
    );
  }
}

class MyCustomTransitionClass extends PageRouteBuilder {
  final Widget route;
  MyCustomTransitionClass({required this.route})
      : super(
            pageBuilder: (ctx, animation, secondaryAnimation) => route,
            transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
              final Animation<Offset> tween =
                  Tween(begin: const Offset(0, -1), end: Offset.zero)
                      .animate(animation);
              return SlideTransition(
                position: tween,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            });
}
