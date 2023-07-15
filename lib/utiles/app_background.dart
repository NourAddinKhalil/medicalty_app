import 'package:flutter/material.dart';
// import 'package:medicalty/gen/assets.gen.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        // image: DecorationImage(
        //   image: AssetImage(Assets.images.backgroundImage.path),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: SafeArea(child: child),
    );
  }
}
