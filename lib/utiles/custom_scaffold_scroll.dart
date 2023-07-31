import 'package:flutter/material.dart';
import 'package:medicalty/utiles/buttons_utiles/custom_elevated_button.dart';

class CustomScaffoldScroll extends StatefulWidget {
  const CustomScaffoldScroll({
    Key? key,
    this.appBar,
    this.body,
    required this.controller,
  }) : super(key: key);
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final ScrollController controller;

  @override
  CustomScaffoldScrollState createState() => CustomScaffoldScrollState();
}

class CustomScaffoldScrollState extends State<CustomScaffoldScroll> {
  var visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      floatingActionButton: !visible
          ? null
          : CustomElevatedIconButton(
              title: 'الذهاب لأعلى',
              iconData: Icons.arrow_upward_outlined,
              allowOnlineOnly: false,
              allowRegisterOnly: false,
              onPressed: () {
                widget.controller.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.bounceInOut,
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.atEdge) {
            if (visible) {
              setState(() {
                visible = false;
              });
              return false;
            }
          } else if (notification.metrics.pixels > 1000) {
            if (!visible) {
              setState(() {
                visible = true;
              });
            }
          } else {
            if (visible) {
              setState(() {
                visible = false;
              });
            }
          }
          return true;
        },
        child: widget.body!,
      ),
    );
  }
}
