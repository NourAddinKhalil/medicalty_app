import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/services/app_info.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Widget _buildText(String text, [double? fontSize]) {
    return Text(
      text,
      style: FontSizes.h8?.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildPolicy({
    required String title,
    required String subtitle,
    required Function() onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: FontSizes.h7?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        const VerticalSizedBox(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 312.w,
              child: Text(
                subtitle,
                textAlign: TextAlign.start,
                style: FontSizes.h8?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            ImageHelpers.getSVGAssetImage(
              20,
              20,
              pic: Assets.icons.link,
            ),
          ],
        ),
        const Divider(
          thickness: 1,
          color: Colors.black45,
          endIndent: 5,
          // indent: 15,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'About',
          backOnRightSide: true,
          icon: Icons.arrow_forward_ios,
        ),
        body: SafeArea(
          child: Padding(
            padding: CustomEdgeInsets.symmetric(16.0, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const VerticalSizedBox(15),
                Text(
                  'Contractor Solution Information ',
                  textAlign: TextAlign.center,
                  style: FontSizes.h6?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const VerticalSizedBox(16),
                _buildText('App version'),
                const VerticalSizedBox(6),
                _buildText(
                  'v${AppInfo.getAppVersion} id user',
                  FontSizes.h8?.fontSize,
                ),
                const VerticalSizedBox(6),
                _buildText('Email Address'),
                const VerticalSizedBox(6),
                _buildText(
                  'jhone@gmail.com',
                  FontSizes.h8?.fontSize,
                ),
                const VerticalSizedBox(6),
                _buildText('Account time '),
                const VerticalSizedBox(6),
                _buildText(
                  'Asia/ amman ',
                  FontSizes.h8?.fontSize,
                ),
                const VerticalSizedBox(6),
                _buildText(
                  'March 31,2023 at 13:30',
                  FontSizes.h8?.fontSize,
                ),
                const VerticalSizedBox(6),
                _buildText('Device '),
                const VerticalSizedBox(6),
                _buildText(
                  'Nonor Hncma-Q (Android11)',
                  FontSizes.h8?.fontSize,
                ),
                const VerticalSizedBox(24),
                _buildPolicy(
                  title: 'Privacy policy ',
                  subtitle: 'get support from out team',
                  onTap: () {},
                ),
                const VerticalSizedBox(6),
                _buildPolicy(
                  title: 'Terms of service',
                  subtitle: 'Read articies about evrey feature in invoicer',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
