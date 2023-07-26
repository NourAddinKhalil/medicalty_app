import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class FavoriteDoctorCard extends StatelessWidget {
  const FavoriteDoctorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorsConstant.dark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Icon(Icons.favorite, color: ColorsConstant.red),
                const Spacer(),
                MyText(
                    text: "3.6", color: ColorsConstant.black, fontSize: 12.sp)
              ],
            ),
            CircleAvatar(
              backgroundImage: const AssetImage("assets/images/person4.png"),
              radius: 25.sp,
            ),
            MyText(
                text: "Dr.Crick", color: ColorsConstant.black, fontSize: 14.sp),
            SizedBox(
              height: 20.h,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Icon(Icons.star, color: ColorsConstant.yellow);
                  }),
            ),
            MyText(
                text: "Specalist Dentist",
                color: ColorsConstant.green3,
                fontSize: 14.sp),
          ],
        ),
      ),
    );
  }
}
