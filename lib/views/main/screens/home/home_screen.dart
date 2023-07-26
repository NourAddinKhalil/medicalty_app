import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/main/widgets/home_widgets/best_doctors_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/custom_filter.dart';
import 'package:medicalty/views/main/widgets/home_widgets/meal_plans_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/paid_ads_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/section_header.dart';
import 'package:medicalty/views/main/widgets/home_widgets/sliver_home_appbar.dart';
import 'package:medicalty/views/main/widgets/home_widgets/the_best_doctor_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/therapy_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverDelegate(
                title: 'Sofia',
                image: Assets.images.doctor.path,
              ),
            ),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SliverPadding(
      padding: CustomEdgeInsets.horizontal(20),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            CircleSqureImage(
              pic: Assets.images.doctorImg.path,
              isCircle: false,
              width: 550,
              height: 245,
              decoration: null,
              fit: BoxFit.fitWidth,
            ),
            const VerticalSizedBox(15),
            _selectGoal(),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            const VerticalSizedBox(15),
            _buildCatgory(),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            const VerticalSizedBox(15),
            _popularDoctors(),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            const VerticalSizedBox(15),
            _mealPlans(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _bestDoctors(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _paidAds(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _theBestDoctors(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _theBestDoctors() {
    return Column(
      children: [
        SectionHeader(
          title: 'The Best Doctors',
          titleStyle: FontSizes.h6?.copyWith(
            fontWeight: FontWeight.w400,
          ),
          onTap: () {},
        ),
        const VerticalSizedBox(10),
        SizedBox(
          height: 240.h,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 13,
            separatorBuilder: (context, index) {
              return const HorizantalSizedBox(8);
            },
            itemBuilder: (BuildContext context, int index) {
              return TheBestDoctorWidget(
                name: 'Dr. Blessing',
                spicialty: 'Dentist Specialist',
                image: Assets.images.docFamale.path,
                rate: 5,
              );
            },
          ),
        ),
        const VerticalSizedBox(10),
        SizedBox(
          // height: 150.h,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            // scrollDirection: Axis.horizontal,
            itemCount: 13,
            separatorBuilder: (context, index) {
              return const HorizantalSizedBox(8);
            },
            itemBuilder: (BuildContext context, int index) {
              return TheBestDoctorWithFavWidget(
                name: 'Dr. Blessing',
                spicialty: 'Dentist Specialist',
                image: Assets.images.docFamale.path,
                rating: 5,
                isFavorite: index == 0,
                onFavoriteChange: (isFav) {},
                viewCount: 288,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _paidAds() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeader(
          title: 'Paid Ads',
          titleStyle: FontSizes.h6?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          onTap: () {},
        ),
        const VerticalSizedBox(10),
        SizedBox(
          height: 170.h,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            primary: true,
            shrinkWrap: true,
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const HorizantalSizedBox(10);
            },
            itemBuilder: (context, index) {
              return PaidAdsWidget(
                name: 'Dr. Crick',
                hourlyPaid: 25,
                rating: 3.7,
                image: Assets.images.ads.path,
                isFavorite: index == 0,
                onFavoriteChange: (isFav) {
                  //
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _popularDoctors() {
    return Column(
      children: [
        SectionHeader(
          title: 'Popular Doctors',
          titleStyle: FontSizes.h6,
          onTap: () {},
        ),
        const VerticalSizedBox(10),
        ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: 3,
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 10,
              endIndent: 10,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return TherapyWidget(
              title: 'Wound changing and sterilization session',
              sessionDuration: 50,
              image: Assets.images.therapy.path,
              isFavorite: index == 0,
              onFavoriteChange: (isFav) {},
            );
          },
        ),
      ],
    );
  }

  Widget _bestDoctors() {
    return Column(
      children: [
        SectionHeader(
          title: 'Best Doctors',
          titleStyle: FontSizes.h6?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          onTap: () {},
        ),
        const VerticalSizedBox(10),
        ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: 3,
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 10,
              endIndent: 10,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return BestDoctorsWidget(
              name: 'Dr. Soaya Ali',
              image: Assets.images.docFamale.path,
              kcal: 132,
              min: 8,
              rate: 5,
              status: 'Beginner',
            );
          },
        ),
      ],
    );
  }

  Widget _mealPlans() {
    return Column(
      children: [
        SectionHeader(
          title: 'Meal Plans',
          titleStyle: FontSizes.h6?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          onTap: () {},
        ),
        const VerticalSizedBox(10),
        ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: 3,
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 10,
              endIndent: 10,
            );
          },
          itemBuilder: (context, index) {
            return MealPlansWidget(
              title: 'LASIK eye surgery',
              fromPrice: 1200,
              image: Assets.images.surge.path,
              toPrice: 2000,
            );
          },
        ),
      ],
    );
  }

  Widget _selectGoal() {
    var selectedIndex = 0;
    return Column(
      children: [
        const SectionHeader(
          title: 'Select your Goal',
          showButton: false,
        ),
        const VerticalSizedBox(10),
        SizedBox(
          height: 50.h,
          child: StatefulBuilder(
            builder: (_, setState) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return const HorizantalSizedBox(10);
                },
                itemBuilder: (BuildContext context, int index) {
                  return CustomFilter(
                    label: 'label ${index + 1}',
                    isSelected: index == selectedIndex,
                    onSelected: (value) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCatgory() {
    return Column(
      children: [
        SectionHeader(
          title: 'Category',
          titleStyle: FontSizes.h8,
          onTap: () {},
        ),
        const VerticalSizedBox(10),
        SizedBox(
          height: 95.h,
          child: ListView.separated(
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) {
              return const HorizantalSizedBox(10);
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  CircleSqureImage(
                    pic: Assets.images.categorypng.path,
                    width: 60,
                    height: 60,
                  ),
                  const VerticalSizedBox(5),
                  Text(
                    'Category ${index + 1}',
                    style: FontSizes.h9,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
