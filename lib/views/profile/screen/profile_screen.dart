import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../review/widget/review_app_bar.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/my_text.dart';
import '../widget/circular_progress_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: const ReviewsAppBar(title: "Profile"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyCircularProgress(
                      valueColor: ColorsConstant.red2,
                      height: 110.h,
                      width: 110.w,
                      value: 0.75,
                      widget: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CircleAvatar(
                          backgroundImage: const AssetImage(
                            "assets/images/person4.png",
                          ),
                          radius: 40.sp,
                        ),
                      )),
                  Container(
                      width: 0.5.w,
                      height: 100.h,
                      color: ColorsConstant.blackGrey),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                          text: "+11-234-598-223",
                          color: ColorsConstant.blackGrey,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal),
                      MyText(
                          text: "2 mon ago",
                          color: ColorsConstant.blackGrey,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                      MyText(
                          text: "address",
                          color: ColorsConstant.blackGrey,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              MyText(
                  text: "SARAH WEGAN",
                  color: ColorsConstant.black,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 15.h),
              const Divider(
                color: ColorsConstant.blackGrey,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          trailing: const Icon(Icons.chevron_right,
                              color: ColorsConstant.blackGrey),
                          title: MyText(
                              text: listTileString[index],
                              color: ColorsConstant.blackGrey,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        const Divider(color: ColorsConstant.blackGrey)
                      ],
                    );
                  }),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(color: ColorsConstant.blackGrey),
                    SizedBox(
                      height: 10.h,
                    ),
                    MyText(
                        text: "Sign Out",
                        color: ColorsConstant.red2,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(color: ColorsConstant.blackGrey),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

List<String> listTileString = ["Edit Profile", "Privacy Policy", "Settings"];
