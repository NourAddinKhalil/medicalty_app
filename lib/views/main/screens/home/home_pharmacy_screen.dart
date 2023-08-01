import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicalty/constants/themes/colors_constant.dart';
import 'package:medicalty/gen/assets.gen.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/app_background.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/views/client/screens/new_client_screen.dart';
import 'package:medicalty/views/expense/screens/new_expense_screen.dart';
import 'package:medicalty/views/invoice/screens/new_invoice_screen.dart';
import 'package:medicalty/views/main/widgets/home_widgets/completed_report_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/create_item_btn.dart';
import 'package:medicalty/views/main/widgets/home_widgets/laboratories_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/opening_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/paid_ads_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/product_expense_widget.dart';
import 'package:medicalty/views/main/widgets/home_widgets/section_header.dart';
import 'package:medicalty/views/main/widgets/home_widgets/sliver_home_appbar.dart';
import 'package:medicalty/views/main/widgets/home_widgets/therapy_widget.dart';
import 'package:medicalty/views/product/screens/new_product_screen.dart';

class HomePharmacyScreen extends StatelessWidget {
  const HomePharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      imagePath: Assets.images.blueBack.path,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverDelegate(
                title: 'Pharmacy',
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
            _allInvoices(),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            const VerticalSizedBox(15),
            _allProducts(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _popularDoctors(),
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
            _allPatients(),
            const VerticalSizedBox(15),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            _allExpenses(),
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

  Widget _completedReports() {
    const itemLength = 13;
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
            itemCount: itemLength + 1,
            separatorBuilder: (context, index) {
              return const HorizantalSizedBox(8);
            },
            itemBuilder: (BuildContext context, int index) {
              if (index == itemLength) {
                return CreateItemBtn(
                  image: Assets.images.invoice.path,
                  onAddPressed: () {
                    // Get.to(() => const NewProductScreen());
                  },
                );
              }
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

  Widget _allInvoices() {
    const itemLength = 13;
    return Column(
      children: [
        SectionHeader(
          title: 'All Invoices',
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
            itemCount: itemLength + 1,
            separatorBuilder: (context, index) {
              return const HorizantalSizedBox(8);
            },
            itemBuilder: (BuildContext context, int index) {
              if (index == itemLength) {
                return CreateItemBtn(
                  image: Assets.icons.invGreen,
                  makeTextColorAsBtn: true,
                  onAddPressed: () {
                    Get.to(() => const NewInvoiceScreen());
                  },
                );
              }
              return CompletedReportWidget(
                image: Assets.icons.invPurple,
                doctorName: 'Dr. Blessing',
                patientName: 'Ali mohammad',
                money: 133,
                name: '#invoice name',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _allProducts() {
    const itemLength = 13;
    return Column(
      children: [
        SectionHeader(
          title: 'All Products / Services',
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
            itemCount: itemLength + 1,
            separatorBuilder: (context, index) {
              return const HorizantalSizedBox(8);
            },
            itemBuilder: (BuildContext context, int index) {
              if (index == itemLength) {
                return CreateItemBtn(
                  onAddPressed: () {
                    Get.to(() => const NewProductScreen());
                  },
                  text: 'Create Product',
                );
              }
              return ProductExpenseWidget(
                image: Assets.images.person4.path,
                name: '#product name',
                desc: '#description',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _allExpenses() {
    const itemLength = 13;
    return Column(
      children: [
        SectionHeader(
          title: 'All Expenses',
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
            itemCount: itemLength + 1,
            separatorBuilder: (context, index) {
              return const HorizantalSizedBox(8);
            },
            itemBuilder: (BuildContext context, int index) {
              if (index == itemLength) {
                return CreateItemBtn(
                  onAddPressed: () {
                    Get.to(() => const NewExpenseScreen());
                  },
                  text: 'Create Expsense',
                );
              }
              return ProductExpenseWidget(
                image: Assets.images.person4.path,
                name: '#expnse name',
                date: DateTime.now(),
                money: 100,
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
}
