import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/images_utiles/circle_image.dart';
import 'package:medicalty/views/client/screens/new_client_screen.dart';
import 'package:medicalty/views/main/widgets/home_widgets/best_doctors_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/book_doctor_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/completed_report_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/custom_filter.dart';
import 'package:medicalty/views/main/widgets/home_widgets/departments_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/laboratories_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/opening_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/paid_ads_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/section_header.dart';
import 'package:medicalty/views/main/widgets/home_widgets/sliver_home_appbar.dart';
import 'package:medicalty/views/main/widgets/home_widgets/social_worker_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/the_best_doctor_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/therapy_widget.dart';

class HomeHospitalScreen extends StatelessWidget {
  const HomeHospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverDelegate(
                title: 'Hospital Name',
                image: Assets.images.ads.path,
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
            OpeningWidget(
              buttonTitle: 'CREATE NOW',
              title: 'Do you want to add more patients?',
              onButtonPressed: () {
                Get.to(() => const NewClientScreen());
              },
            ),
            const VerticalSizedBox(15),
            _bookingToday(),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            const VerticalSizedBox(15),
            _departmentsInHospital(),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            const VerticalSizedBox(15),
            _buildEmployees(),
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
            _allDoctors(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _allPatients(),
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
            _bookForPatient(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _socialWorker(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _nutrition(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _insuranceComapnies(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _completedReports(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _theBestDoctors(
              title: 'Daily Schedule',
              showRestWidgets: false,
            ),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _theBestDoctors(
              title: 'Natural Therapy',
              showRestWidgets: false,
            ),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _hospitalDepartments(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _allLaboratories(),
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

  Widget _hospitalDepartments() {
    var selectedIndex = 0;
    return Column(
      children: [
        SectionHeader(
          title: 'Hospital Departments',
          titleStyle: FontSizes.h7?.copyWith(
            fontWeight: FontWeight.w600,
          ),
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
        const VerticalSizedBox(10),
        ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (context, index) {
            return const VerticalSizedBox(8);
          },
          itemBuilder: (context, index) {
            return BookDoctorWidget(
              name: 'Dr. Blessing',
              spicialty: 'Dentist Specialist',
              image: Assets.images.docFamale.path,
              isFavorite: index == 0,
              onFavoriteChange: (isFav) {},
              expierence: 7,
              percent: 87,
              nextAvailable: '11:00PM Today',
              numberOfPatient: 90,
              onBookPressed: () {},
            );
          },
        ),
      ],
    );
  }

  Widget _allLaboratories() {
    return Column(
      children: [
        SectionHeader(
          title: 'All Laboratories',
          titleStyle: FontSizes.h7?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          showButton: false,
        ),
        const VerticalSizedBox(10),
        ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (context, index) {
            return const VerticalSizedBox(8);
          },
          itemBuilder: (context, index) {
            return LaboratoriesWidget(
              name: 'name laboratories',
              address: 'jordan - BOX - 22222',
              country: 'JORDan',
              workNumber: '+962 777777777',
              phone: '+962 888888888',
              emial: 'mail@mail.com',
              onButtonPressed: () {},
              image: Assets.images.docFamale.path,
            );
          },
        ),
      ],
    );
  }

  Widget _nutrition() {
    return Column(
      children: [
        SectionHeader(
          title: 'nutrition',
          titleStyle: FontSizes.h7?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          showButton: false,
        ),
        const VerticalSizedBox(10),
        ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: 4,
          separatorBuilder: (context, index) {
            return const VerticalSizedBox(8);
          },
          itemBuilder: (context, index) {
            return SocialWorkerWidget(
              image: Assets.images.socialWorker.path,
              name: 'Richard Will',
              rate: 4.8,
              subtitle: 'High Intensity Training',
              experience: 5,
              onTap: () {},
            );
          },
        ),
      ],
    );
  }

  Widget _socialWorker() {
    return Column(
      children: [
        SectionHeader(
          title: 'Social worker',
          titleStyle: FontSizes.h7?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          showButton: false,
        ),
        const VerticalSizedBox(10),
        ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: 4,
          separatorBuilder: (context, index) {
            return const VerticalSizedBox(8);
          },
          itemBuilder: (context, index) {
            return SocialWorkerWidget(
              image: Assets.images.socialWorker.path,
              name: 'Richard Will',
              rate: 4.8,
              subtitle: 'High Intensity Training',
              experience: 5,
              onTap: () {},
            );
          },
        ),
      ],
    );
  }

  Widget _bookForPatient() {
    var selectedIndex = 0;
    return Column(
      children: [
        SectionHeader(
          title: 'Book now for patients',
          titleStyle: FontSizes.h7?.copyWith(
            fontWeight: FontWeight.w500,
          ),
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
        const VerticalSizedBox(10),
        ListView.separated(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: 10,
          separatorBuilder: (context, index) {
            return const VerticalSizedBox(8);
          },
          itemBuilder: (context, index) {
            return BookDoctorWidget(
              name: 'Dr. Blessing',
              spicialty: 'Dentist Specialist',
              image: Assets.images.docFamale.path,
              isFavorite: index == 0,
              onFavoriteChange: (isFav) {},
              expierence: 7,
              percent: 87,
              nextAvailable: '11:00PM Today',
              numberOfPatient: 90,
              onBookPressed: () {},
            );
          },
        ),
      ],
    );
  }

  Widget _completedReports() {
    return Column(
      children: [
        SectionHeader(
          title: 'Completed Reports',
          titleStyle: FontSizes.h6?.copyWith(
            fontWeight: FontWeight.w400,
          ),
          onTap: () {},
        ),
        const VerticalSizedBox(10),
        SizedBox(
          height: 280.h,
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
              return CompletedReportWidget(
                image: Assets.images.report.path,
                doctorName: 'Dr. Blessing',
                patientName: 'Ali mohammad',
                rate: 5,
                name: 'F035-THHC',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _theBestDoctors(
      {String title = 'The Best Doctors', bool showRestWidgets = true}) {
    return Column(
      children: [
        SectionHeader(
          title: title,
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
        if (showRestWidgets) const VerticalSizedBox(10),
        if (showRestWidgets)
          ListView.separated(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            itemCount: 2,
            separatorBuilder: (context, index) {
              return const VerticalSizedBox(8);
            },
            itemBuilder: (context, index) {
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
      ],
    );
  }

  Widget _insuranceComapnies() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionHeader(
          title: 'Insurance companies',
          titleStyle: FontSizes.h7?.copyWith(
            fontWeight: FontWeight.w500,
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
                name: 'Romans',
                subtitle: 'Jordan',
                subtitleColor: ColorsConstant.green1,
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

  Widget _allPatients([bool showlable = true]) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showlable)
          SectionHeader(
            title: 'All Patients',
            titleStyle: FontSizes.h6?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            onTap: () {},
          ),
        if (showlable) const VerticalSizedBox(10),
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
                subtitle: '17 Years',
                subtitleColor: ColorsConstant.green1,
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

  Widget _allDoctors() {
    return Column(
      children: [
        SectionHeader(
          title: 'All Doctors',
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

  Widget _departmentsInHospital() {
    var selectedIndex = 0;
    return Column(
      children: [
        const SectionHeader(
          title: 'Departments in the hospital',
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
            return DepartmentsWidget(
              doctorName: 'Dr. Soaya Ali',
              image: Assets.images.docFamale.path,
              rate: 5,
              experience: 8,
              sectionName: 'Dentil',
            );
          },
        ),
      ],
    );
  }

  Widget _buildEmployees() {
    return Column(
      children: [
        SectionHeader(
          title: 'All Employees',
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

  Widget _bookingToday() {
    return Column(
      children: [
        SectionHeader(
          title: 'Booking today\'s',
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
              name: 'Jasmin Noor',
              image: Assets.images.seeDoctor.path,
              startTime: TimeOfDay.now(),
              endTime: const TimeOfDay(hour: 24, minute: 03),
              rate: 5,
              date: DateTime.now(),
            );
          },
        ),
      ],
    );
  }
}
