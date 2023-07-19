import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/views/purchase_plan/widgets/plan_container.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';

class PurchasePlanScreen extends StatelessWidget {
  const PurchasePlanScreen({super.key});

  Widget _buildPlanFeatures(String title,
      [Widget? titleWidget, Color color = ColorsConstant.transpartenGreen]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 5.r,
          backgroundColor: color,
        ),
        const HorizantalSizedBox(10),
        titleWidget ??
            Text(
              title,
              style: FontSizes.h8?.copyWith(
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
      ],
    );
  }

  Widget _buildExplination(String title) {
    return SizedBox(
      width: 350.w,
      child: Text(
        title,
        style: FontSizes.h8?.copyWith(
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'Choose a Plan',
          backOnRightSide: true,
          icon: Icons.arrow_forward_ios,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                PlanContainer(
                  planTitle: 'Monthly plan',
                  planPrice: '\$ 49.99',
                  onPressed: () {},
                  children: [
                    _buildExplination(
                      'Impress clients and get paid faster with online quotes and invoices.',
                    ),
                    const VerticalSizedBox(15),
                    _buildPlanFeatures('Manage unlimited clients '),
                    _buildPlanFeatures('Send unlimited invoices and quotes '),
                    _buildPlanFeatures('Accept and track payments '),
                    _buildPlanFeatures('Real-time scheduling for job '),
                    _buildPlanFeatures('10 user including '),
                    _buildPlanFeatures(
                        'unlimited clients,invoices and quotes '),
                    const VerticalSizedBox(10),
                    _buildPlanFeatures(
                      'Save 19% yearly ',
                      Text(
                        'Save 19% yearly ',
                        style: FontSizes.h8?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Colors.transparent,
                    ),
                  ],
                ),
                PlanContainer(
                  planTitle: 'Monthly plan',
                  planPrice: '\$ 39.99',
                  onPressed: () {},
                  children: [
                    _buildExplination(
                      'Impress clients and get paid faster with online quotes and invoices.',
                    ),
                    const VerticalSizedBox(15),
                    _buildPlanFeatures('Manage unlimited clients '),
                    _buildPlanFeatures('Send unlimited invoices and quotes '),
                    _buildPlanFeatures('Accept and track payments '),
                    _buildPlanFeatures('Real-time scheduling for job '),
                    const VerticalSizedBox(10),
                    _buildPlanFeatures(
                      'Save 12% yearly ',
                      Text(
                        'Save 12% yearly ',
                        style: FontSizes.h8?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Colors.transparent,
                    ),
                  ],
                ),
                const VerticalSizedBox(20),
                Container(
                  padding: CustomEdgeInsets.symmetric(20, 15),
                  color: ColorsConstant.appbarColor,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 330.w,
                        child: Text(
                          'Once you subscribe, your plan will be charged to your Google Play Store Account at the time of purchase and automatically renews unless cancelled at least 24 hours before the end of the current period. Cancel your subscription at anytime through your Google Store Account ',
                          textAlign: TextAlign.center,
                          style: FontSizes.h8?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const VerticalSizedBox(20),
                      Text(
                        'Previously subscribed?',
                        textAlign: TextAlign.center,
                        style: FontSizes.h7?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const VerticalSizedBox(10),
                      SizedBox(
                        width: 330.w,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Restore Purchases ',
                            style: FontSizes.h8?.copyWith(
                              color: ColorsConstant.green2,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                //
                              },
                            children: [
                              TextSpan(
                                text: 'and Read Our ',
                                style: FontSizes.h8?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy Terms Of Service',
                                style: FontSizes.h8?.copyWith(
                                  color: ColorsConstant.green2,
                                  fontWeight: FontWeight.w400,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const VerticalSizedBox(20),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
