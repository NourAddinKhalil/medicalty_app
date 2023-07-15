import 'package:flutter/material.dart';
import 'package:medicalty/helpers/font_sizes.dart';
import 'package:medicalty/utiles/custom_edge_insets.dart';
import 'package:medicalty/utiles/custom_sized_box.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.children,
    this.title = '',
    this.titleWidget,
    this.paddingEdges = true,
    this.showElevation = true,
  }) : super(key: key);

  final List<Widget> children;
  final Widget? titleWidget;
  final String title;
  final bool paddingEdges;
  final bool showElevation;

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context);
    final showTitle = title != '';

    return Card(
      color: Colors.transparent, //themeColor.scaffoldBackgroundColor,
      elevation: showElevation ? 2 : 0,
      shadowColor: Colors.transparent,
      margin: CustomEdgeInsets.only(bottom: paddingEdges ? 5.0 : 0.0),
      child: Padding(
        padding: CustomEdgeInsets.all(paddingEdges ? 8.0 : 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showTitle && titleWidget == null)
              Text(
                title,
                style: FontSizes.h5?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themeColor.colorScheme.onSurface,
                ),
              ),
            if (titleWidget != null) titleWidget!,
            if (showTitle || titleWidget != null) const VerticalSizedBox(14),
            ...children,
          ],
        ),
      ),
    );
  }
}
