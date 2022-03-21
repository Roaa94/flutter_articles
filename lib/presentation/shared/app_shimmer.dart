import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../styles/app_colors.dart';

class AppShimmer extends StatelessWidget {
  final double? width;
  final double? height;

  const AppShimmer({
    Key? key,
    this.width = 100,
    this.height = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        highlightColor: AppColors.grayLight,
        baseColor: AppColors.gray,
        child: Container(
          width: width,
          height: height,
          color: AppColors.white,
        ),
      ),
    );
  }
}
