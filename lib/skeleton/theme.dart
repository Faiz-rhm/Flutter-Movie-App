import 'package:flutter/material.dart';

class SkeletonTheme extends InheritedWidget {
  final LinearGradient? shimmerGradient;
  final LinearGradient? darkShimmerGradient;
  final ThemeMode? themeMode;

  const SkeletonTheme({
    super.key,
    required super.child,
    this.shimmerGradient,
    this.darkShimmerGradient,
    this.themeMode,
  });

  static SkeletonTheme? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SkeletonTheme>();

  @override
  bool updateShouldNotify(SkeletonTheme oldWidget) =>
      oldWidget.themeMode != themeMode ||
      oldWidget.shimmerGradient != shimmerGradient ||
      oldWidget.darkShimmerGradient != darkShimmerGradient;
}
