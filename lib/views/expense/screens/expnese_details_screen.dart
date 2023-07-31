import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/control_widget_size.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpneseDetailsScreen extends StatelessWidget {
  const ExpneseDetailsScreen({super.key});

  Widget _buildEpenseItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSizedBox(20),
        Text(
          title,
          style: FontSizes.h6?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
        ),
        const VerticalSizedBox(5),
        Text(
          subtitle,
          style: FontSizes.h6?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppbar(
          title: 'Expense Details',
          backOnRightSide: true,
          icon: Icons.arrow_forward_ios,
        ),
        body: SingleChildScrollView(
          padding: CustomEdgeInsets.symmetric(16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Expense',
                textAlign: TextAlign.start,
                style: FontSizes.h6?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalSizedBox(15),
              Text(
                'Expense',
                textAlign: TextAlign.start,
                style: FontSizes.h6?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalSizedBox(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: FontSizes.h6?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const VerticalSizedBox(5),
                      Text(
                        '80.00\$',
                        style: FontSizes.h6?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  const HorizantalSizedBox(80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date ',
                        style: FontSizes.h6?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const VerticalSizedBox(5),
                      Text(
                        'Apr 14, 2023',
                        style: FontSizes.h6?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: HorizantalSizedBox(10)),
                ],
              ),
              const VerticalSizedBox(10),
              _buildEpenseItem(
                'Reimburse to ',
                'John smith',
              ),
              const VerticalSizedBox(10),
              _buildEpenseItem(
                'Accounting code',
                'No code',
              ),
              const VerticalSizedBox(10),
              _buildEpenseItem(
                'Linked Job',
                'None',
              ),
              const VerticalSizedBox(20),
              Text(
                'Attached receipt ',
                textAlign: TextAlign.start,
                style: FontSizes.h6?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              const VerticalSizedBox(10),
              ControlWidgetSize(
                child: Container(
                  width: 180.w,
                  height: 200.w,
                  color: const Color(0xFFEEEEEE),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
