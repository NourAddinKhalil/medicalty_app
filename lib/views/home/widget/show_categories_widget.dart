import 'package:flutter/material.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class ShowCategoriesWidget extends StatelessWidget {
  const ShowCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: jobs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              height: 50,
              width: 50,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(photos[index]),
                      radius: 25,
                    ),
                  ),
                  const SizedBox(height: 2),
                  MyText(
                      text: jobs[index],
                      color: ColorsConstant.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w400)
                ],
              ),
            );
          }),
    );
  }
}

List<String> jobs = [
  "Doctor",
  "Nurses",
  "Physiotherapist",
  "Medical",
  "Doctor",
  "Nurses",
  "Physiotherapist",
  "Medical",
];

List<String> photos = [
  "assets/images/person1.png",
  "assets/images/person2.png",
  "assets/images/person3.png",
  "assets/images/person4.png",
  "assets/images/person1.png",
  "assets/images/person2.png",
  "assets/images/person3.png",
  "assets/images/person4.png",
];
