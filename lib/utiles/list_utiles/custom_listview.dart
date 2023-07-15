import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalty/controllers/api_controllers/connection_controller.dart';
import 'package:medicalty/utiles/custom_loading.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';
import 'package:medicalty/utiles/list_utiles/no_data.dart';
import 'package:medicalty/views/problems/internet_problem_screen.dart';
import 'package:medicalty/views/problems/server_problem_screen.dart';

class CustomListview<ListType> extends StatefulWidget {
  const CustomListview({
    super.key,
    required this.getItems,
    required this.child,
    required this.nodataImage,
    required this.nodataTitle,
    this.nodataSubTitle = '',
    this.scrollDirection = Axis.vertical,
  });
  final Future<List<ListType>> getItems;
  final Widget Function(ListType data) child;
  final Axis scrollDirection;
  final String nodataImage;
  final String nodataTitle;
  final String nodataSubTitle;

  @override
  State<CustomListview<ListType>> createState() =>
      _CustomListviewState<ListType>();
}

class _CustomListviewState<ListType> extends State<CustomListview<ListType>> {
  late final ScrollController controller;
  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {}

  @override
  void dispose() {
    controller.removeListener(scrollListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConnectionController>(builder: (conController) {
      if (!conController.isOnline) {
        return const InternetProblemScreen();
      }
      return FutureBuilder<List<ListType>>(
        future: widget.getItems,
        //  initialData: InitialData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomLoading();
          }

          if (snapshot.hasError) {
            return ServerProblemScreen(
              moreErrorInfo: snapshot.error.toString(),
              tryAgain: () {},
            );
          }

          final items = snapshot.data ?? [];

          if (!snapshot.hasData || items.isEmpty) {
            return NoData(
              imagePath: widget.nodataImage,
              title: widget.nodataTitle,
              subTitle: widget.nodataSubTitle,
            );
          }

          return ListView.separated(
            itemCount: items.length,
            scrollDirection: widget.scrollDirection,
            controller: controller,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final item = items[index];
              return widget.child(item);
            },
            separatorBuilder: (context, index) {
              return const VerticalSizedBox(8);
            },
          );
        },
      );
    });
  }
}
