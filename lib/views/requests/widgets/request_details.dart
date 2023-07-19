import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/views/requests/widgets/arrival_time_widget.dart';
import 'package:medicalty/views/requests/widgets/request_money_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({super.key});

  Widget _buildContainer({
    required Widget child,
    double verticalPadding = 0,
    double horizantalPadding = 0,
    Color color = const Color(0xFFF6F6F6),
  }) {
    return Container(
      color: color,
      padding: CustomEdgeInsets.symmetric(verticalPadding, horizantalPadding),
      child: child,
    );
  }

  Widget _buildScheduleQuestion({
    required String title,
    required String subtitle,
    Widget? subtitleWidget,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FontSizes.h7?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
        ),
        subtitleWidget ??
            Text(
              subtitle,
              style: FontSizes.h8?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContainer(
      child: ListView(
        primary: true,
        shrinkWrap: false,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          const VerticalSizedBox(10),
          _buildContainer(
            horizantalPadding: 30,
            verticalPadding: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Request from',
                  style: FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                ),
                const VerticalSizedBox(8),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Service details',
                            style: FontSizes.h7?.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.sp,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                      const VerticalSizedBox(8),
                      Text(
                        'Please provide as much information as you can qweeee',
                        style: FontSizes.h9?.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const VerticalSizedBox(
            30,
            color: Colors.white,
          ),
          _buildContainer(
            horizantalPadding: 30,
            verticalPadding: 20,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Schedule an appointment ',
                            style: FontSizes.h7?.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.sp,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                    const VerticalSizedBox(8),
                    _buildScheduleQuestion(
                      title: 'IF available, Which day work best for you? ',
                      subtitle: 'Apr 25, 2023',
                    ),
                    const VerticalSizedBox(8),
                    _buildScheduleQuestion(
                      title: 'What is another day that works for you? ',
                      subtitle: 'Apr 25, 2023',
                    ),
                    const VerticalSizedBox(12),
                    _buildScheduleQuestion(
                      title: 'What are your preferred arrival time?',
                      subtitle: '',
                      subtitleWidget: Column(
                        children: [
                          ArrivalTimeWidget(
                            title: 'Any Time',
                            onChange: (newVal) {},
                            selected: true,
                            activateOnTab: false,
                            showCircleOnEnd: true,
                          ),
                          ArrivalTimeWidget(
                            title: 'Morning',
                            onChange: (newVal) {},
                            selected: true,
                            activateOnTab: false,
                            showCircleOnEnd: true,
                          ),
                          ArrivalTimeWidget(
                            title: 'Afternoon',
                            onChange: (newVal) {},
                            selected: false,
                            activateOnTab: false,
                            showCircleOnEnd: true,
                          ),
                          ArrivalTimeWidget(
                            title: 'Evening',
                            onChange: (newVal) {},
                            selected: false,
                            activateOnTab: false,
                            showCircleOnEnd: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const VerticalSizedBox(
            30,
            color: Colors.white,
          ),
          _buildContainer(
            horizantalPadding: 30,
            verticalPadding: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assessment details',
                  style: FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                ),
                const VerticalSizedBox(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 24.sp,
                      color: Colors.black87,
                    ),
                    const HorizantalSizedBox(8),
                    Text(
                      'Schedule',
                      style: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const VerticalSizedBox(
            30,
            color: Colors.white,
          ),
          _buildContainer(
            horizantalPadding: 30,
            verticalPadding: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overview',
                  style: FontSizes.h7?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.black45,
                  ),
                ),
                const VerticalSizedBox(15),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'qw',
                        style: FontSizes.h7?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15.sp,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 10,
                  endIndent: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: Colors.black45,
                      size: 24.sp,
                    ),
                    const HorizantalSizedBox(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sara Yassin ',
                          style: FontSizes.h7?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Reta',
                          style: FontSizes.h7?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black45,
                          ),
                        ),
                        Text(
                          'Wadi As-seir',
                          style: FontSizes.h7?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black45,
                          ),
                        ),
                        Text(
                          'Amman, Amman Governorate',
                          style: FontSizes.h7?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Icon(
                      Icons.link_outlined,
                      color: Colors.black45,
                      size: 24.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const VerticalSizedBox(
            10,
            color: Colors.white,
          ),
          _buildContainer(
            // horizantalPadding: 20,
            color: Colors.white,
            child: const Column(
              children: [
                RequestMoneyWidget(
                  title: 'Subtotal',
                  horizantalPadding: 30,
                  money: 200,
                  backColor: Color(0xFFF6F6F6),
                ),
                VerticalSizedBox(10),
                RequestMoneyWidget(
                  title: 'Service Price',
                  horizantalPadding: 30,
                  money: 200,
                  textColor: ColorsConstant.green1,
                  backColor: Color(0xFFF6F6F6),
                ),
                VerticalSizedBox(10),
                RequestMoneyWidget(
                  title: 'Total',
                  horizantalPadding: 30,
                  money: 200,
                  spaceBetween: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
