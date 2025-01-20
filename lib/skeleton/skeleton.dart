part of 'widgets.dart';

/*
thanks to: https://flutter.dev/docs/cookbook/effects/shimmer-loading
*/
class Skeleton extends StatefulWidget {
  const Skeleton({
    super.key,
    required this.isLoading,
    required this.skeleton,
    required this.child,
    this.shimmerGradient,
    this.darkShimmerGradient,
    this.duration,
    this.themeMode,
  });

  final bool isLoading;
  final Widget skeleton;
  final Widget child;
  final LinearGradient? shimmerGradient;
  final LinearGradient? darkShimmerGradient;
  final Duration? duration;
  final ThemeMode? themeMode;

  @override
  SkeletonState createState() => SkeletonState();
}

class SkeletonState extends State<Skeleton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      child: widget.isLoading
          ? ShimmerWidget(
              shimmerGradient: widget.shimmerGradient,
              darkShimmerGradient: widget.darkShimmerGradient,
              duration: widget.duration,
              themeMode: widget.themeMode,
              child: _SkeletonWidget(
                isLoading: widget.isLoading,
                // child: widget.child,
                skeleton: widget.skeleton,
              ),
            )
          : widget.child,
    );
  }
}

class _SkeletonWidget extends StatefulWidget {
  const _SkeletonWidget({
    super.key,
    required this.isLoading,
    required this.skeleton,
    // required this.child,
  });

  final bool isLoading;
  final Widget skeleton;
  // final Widget child;

  @override
  __SkeletonWidgetState createState() => __SkeletonWidgetState();
}

class __SkeletonWidgetState extends State<_SkeletonWidget> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (!widget.isLoading) {
    //   return widget.child;
    // }

    // Collect ancestor shimmer info.
    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      // The ancestor Shimmer widget has not laid
      // itself out yet. Return an empty box.
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.currentGradient;

    if (context.findRenderObject() == null) return const SizedBox();

    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.skeleton,
    );
  }
}
