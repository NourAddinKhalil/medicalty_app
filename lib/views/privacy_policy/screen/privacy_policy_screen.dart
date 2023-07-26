import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/themes/colors_constant.dart';
import '../../../utiles/app_background.dart';
import '../../../utiles/buttons_utiles/my_button.dart';
import '../../../utiles/my_text.dart';
import '../../review/widget/review_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showImage: false,
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: MyButton(
              color: ColorsConstant.blackBlue,
              widget: MyText(
                  text: "Agree & Continue",
                  color: ColorsConstant.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
              function: () {}),
        ),
        appBar: const ReviewsAppBar(title: "Privacy Policy"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                    text: "Lorem ipsum dolor sit amet",
                    color: ColorsConstant.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
                SizedBox(height: 20.h),
                MyText(
                    text:
                        "Consectetur adipiscing elit. Natoque phasellus lobortis mattis cursus faucibus hac proin risus. Turpis phasellus massa ullamcorper volutpat. Ornare commodo non integer fermentum nisi, morbi id. Vel tortor mauris feugiat amet, maecenas facilisis risus, in faucibus. Vestibulum ullamcorper fames eget enim diam fames faucibus duis ac. Aliquam non tellus semper in dignissim nascetur venenatis lacus.\n\nLectus vel non varius interdum vel tellus sed mattis. Sit laoreet auctor arcu mauris tincidunt sociis tristique pharetra neque. Aliquam pharetra elementum nisl sapien. Erat nisl morbi eu dolor in. Sapien ut lacus dui libero morbi tristique.\n\nSit praesent mi, dolor, magna in pellentesque sollicitudin odio sed. Sit nibh aliquam enim ipsum lectus sem fermentum congue velit. Purus habitant odio in morbi aliquet velit pulvinar. Facilisis ut amet interdum pretium. Fames pretium eget orci facilisis mattis est libero facilisis ullamcorper. Est auctor amet egestas risus libero et. Auctor faucibus sit id fringilla vitae. Ac volutpat sodales tristique ut netus turpis.\n\nLorem ipsum dolor sit amet, consectetur ",
                    color: ColorsConstant.grey,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
