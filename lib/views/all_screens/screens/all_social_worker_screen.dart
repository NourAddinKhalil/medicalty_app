import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/custom_sized_box.dart';
import '../../../utiles/my_text.dart';
import '../../patient/widget/linear_gradient_widget.dart';

class AllSocialWorkerScreen extends StatelessWidget {
  const AllSocialWorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorsConstant.white,
          body: Stack(children: [
            SizedBox(
              width: double.infinity,
              height: 300.h,
              child: const LinearGradientContainer(
                beginAlignment: Alignment.topRight,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_left,
                                color: ColorsConstant.black)),
                        MyText(
                          text: "All social workers",
                          color: ColorsConstant.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox()
                      ],
                    ),
                    const VerticalSizedBox(40),
                    const AllSocialWorkerCardWidget()
                  ],
                ),
              ),
            )
          ])),
    );
  }
}

class AllSocialWorkerCardWidget extends StatelessWidget {
  const AllSocialWorkerCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
              elevation: 20,
              shadowColor: ColorsConstant.dark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 90.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            color: ColorsConstant.yellow,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/doctor.png",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox()
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            MyText(
                                text: "Richard Will",
                                color: ColorsConstant.black,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.normal),
                            SizedBox(
                              width: 5.w,
                            ),
                            Container(
                              width: 30.w,
                              decoration: BoxDecoration(
                                  color: ColorsConstant.blackBlue,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: MyText(
                                    color: ColorsConstant.white,
                                    text: "4.6",
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        MyText(
                            text: "High Intensity Training",
                            color: ColorsConstant.green2,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.normal),
                        MyText(
                            text: "5 years experience",
                            color: ColorsConstant.green2,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.normal)
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: ColorsConstant.red,
                            )),
                        const VerticalSizedBox(10),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorsConstant.blackBlue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyText(
                                  text: "Book now",
                                  color: ColorsConstant.white,
                                  fontSize: 15.sp),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ));
        });
  }
}
