import 'package:flutter/material.dart';

import '../../../utiles/app_background.dart';
import '../../review/widget/review_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: const SafeArea(
        child: Scaffold(
          appBar: ReviewsAppBar(title: "Contact Us"),
        ),
      ),
    );
  }
}
