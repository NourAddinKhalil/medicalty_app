import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/appbar_utiles/custom_appbar.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/form_utiles/custom_text_form_field.dart';
import 'package:medicalty/views/main/widgets/home_widgets/open_drawer_btn.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'Search',
          leading: SizedBox(),
          actions: [
            OpenDrawerBtn(
              color: ColorsConstant.primaryColor,
            ),
          ],
        ),
        body: Padding(
          padding: CustomEdgeInsets.symmetric(8.0, 20),
          child: Column(
            children: [
              SingleChildScrollView(
                padding: CustomEdgeInsets.horizontal(8),
                reverse: true,
                child: CustomTextFormField(
                  label: 'search',
                  showlable: false,
                  showHint: true,
                  showUnderlinedStyle: true,
                  fillColor: null,
                  icon: Icons.search,
                  controller: TextEditingController(),
                  validator: null,
                  onSaved: null,
                ),
              ),
              const VerticalSizedBox(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomElevatedIconButton(
                    iconData: Icons.format_quote_rounded,
                    title: 'Quotes',
                    size: 24,
                    angle: 9.4,
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6F6F6),
                      foregroundColor: Colors.black,
                      padding: CustomEdgeInsets.symmetric(8, 12),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      textStyle: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  // const HorizantalSizedBox(5),
                  CustomElevatedButton(
                    title: 'Requests',
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6F6F6),
                      foregroundColor: Colors.black,
                      padding: CustomEdgeInsets.symmetric(8, 16),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      textStyle: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  // const HorizantalSizedBox(5),
                  CustomElevatedIconButton(
                    iconData: Icons.person,
                    title: 'Clients',
                    size: 24,
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF6F6F6),
                      foregroundColor: Colors.black,
                      padding: CustomEdgeInsets.symmetric(8, 12),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      textStyle: FontSizes.h7?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const VerticalSizedBox(10),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Recently active',
                  textAlign: TextAlign.start,
                  style: FontSizes.h6,
                ),
              ),
              const VerticalSizedBox(10),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const VerticalSizedBox(10);
                  },
                  itemCount: 10,
                  padding: CustomEdgeInsets.only(left: 5, right: 5, bottom: 10),
                  itemBuilder: (_, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          index % 2 == 0 ? 'Etrevago' : 'Contractour',
                          style: FontSizes.h7,
                        ),
                        const VerticalSizedBox(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Apr  05  |  Jordan',
                              style: FontSizes.h7?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: ColorsConstant.tableGrey,
                              ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 14.w,
                                    height: 14.h,
                                    color: index % 2 == 0
                                        ? ColorsConstant.pending
                                        : ColorsConstant.tableGrey,
                                  ),
                                  const HorizantalSizedBox(8),
                                  Text(
                                    index % 2 == 0 ? 'Awaiting' : 'Draft',
                                    style: FontSizes.h7?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: ColorsConstant.tableGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
