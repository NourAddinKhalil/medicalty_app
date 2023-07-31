import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';

class CustomDialogFormShow {
  static Future<void> showCustomDialog(
      BuildContext context, Widget child, String title) async {
    return await showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      builder: (ctx) {
        return Dialog(
          // backgroundColor: Theme.of(ctx).scaffoldBackgroundColor,
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Stack(
              children: [
                Container(
                  // margin: const EdgeInsets.only(top: 35.0),
                  // height: 300,
                  padding: CustomEdgeInsets.only(
                    top: 150.0,
                    right: 32.0,
                    left: 32.0,
                    bottom: 32.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: child,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    tooltip: 'إغلاق النافذة',
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    icon: const Icon(Icons.close_outlined),
                  ),
                ),
                Positioned(
                  right: 100,
                  child: Padding(
                    padding: CustomEdgeInsets.all(30),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
