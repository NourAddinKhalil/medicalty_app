import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/images_utiles/image_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  Widget _buildItems({
    required String title,
    required String subtitle,
    required Function() onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: FontSizes.h7?.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: FontSizes.h8?.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: ImageHelpers.getSVGAssetImage(
        20,
        20,
        pic: Assets.icons.link,
      ),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      thickness: 2,
      color: Colors.black45,
      endIndent: 15,
      indent: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'Support',
          backOnRightSide: true,
          icon: Icons.arrow_forward_ios,
        ),
        body: Container(
          color: const Color(0xFFEDEDED),
          padding: CustomEdgeInsets.symmetric(5, 12),
          margin: CustomEdgeInsets.only(top: 16),
          height: 320.h,
          child: Column(
            children: [
              _buildItems(
                title: 'Support Chat',
                subtitle: 'get support from out team',
                onTap: () {},
              ),
              _buildDivider(),
              _buildItems(
                title: 'Help Center',
                subtitle: 'Read articies about evrey feature in invoicer',
                onTap: () {},
              ),
              _buildDivider(),
              _buildItems(
                title: 'Help Center on Youtube',
                subtitle: 'Read articies about evrey feature in invoicer',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
