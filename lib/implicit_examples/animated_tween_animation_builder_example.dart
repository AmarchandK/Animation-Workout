import 'dart:developer';

import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    log("main build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 200.0),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) {
            log('build');
            return Container(
              width: value,
              height: value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withOpacity(0.5),
                    blurRadius: value,
                    spreadRadius: value,
                  ),
                  BoxShadow(
                    color: Colors.yellowAccent.withOpacity(0.5),
                    blurRadius: value,
                    spreadRadius: value / 4,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: child,
            );
          },
          child: const FittedBox(
              child: Text(
            "Tween Animation",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.yellowAccent,
                fontSize: 20),
          )),
        ),
      ),
    );
  }
}
