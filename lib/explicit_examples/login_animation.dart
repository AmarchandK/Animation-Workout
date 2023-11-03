import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<double> logoFadeOpacity;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    logoFadeOpacity = Tween(begin: 0.0, end: 1.0).animate(animationController);
    slideAnimation = Tween(begin: const Offset(-1, -1), end: const Offset(0, 0))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.elasticOut));
    scaleAnimation = Tween<double>(begin: 0.3, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInSine));
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: logoFadeOpacity,
              child: const FlutterLogo(
                size: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SlideTransition(
                position: slideAnimation,
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
