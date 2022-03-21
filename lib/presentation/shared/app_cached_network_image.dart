import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_articles/presentation/shared/app_shimmer.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final LoadingErrorWidgetBuilder? customErrorWidgetBuilder;
  final Widget? customErrorWidget;
  final Widget? loaderWidget;
  final bool noLoader;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Alignment alignment;
  final Color? color;
  final BlendMode? colorBlendMode;

  const AppCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.customErrorWidgetBuilder,
    this.noLoader = false,
    this.customErrorWidget,
    this.loaderWidget,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      placeholder: noLoader ? null : (_, __) => Center(child: loaderWidget ?? AppShimmer(width: width, height: height)),
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      alignment: alignment,
      errorWidget: customErrorWidgetBuilder ??
          (BuildContext context, String url, dynamic error) {
            // log("🖼 🖼 🖼 🖼 🖼 🖼 🖼 🖼 Error Fetching Image 🖼 🖼 🖼 🖼 🖼 🖼 🖼 🖼");
            // log("Image url: $url");
            return customErrorWidget ?? const Center(child: Text('-'));
          },
    );
  }
}
