import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';

class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      shadowColor: ColorsConstant.dark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/doctor2.png",
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                  text: "Dr.Blessing",
                  color: ColorsConstant.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
              MyText(
                  text: "Specialist Dentist",
                  color: ColorsConstant.blackGrey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold),
              SizedBox(
                height: 18.h,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Icon(Icons.star,
                          size: 15.sp, color: ColorsConstant.yellow);
                    }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: ColorsConstant.red,
                    )),
                MyText(
                    text: "2.8(288 views)",
                    color: ColorsConstant.black,
                    fontSize: 12.sp)
              ],
            ),
          )
        ],
      ),
    );
  }
}
