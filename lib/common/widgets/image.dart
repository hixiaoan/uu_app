part of widgets;

enum CustomImageType { asset, network, file }

class CustomImage extends StatelessWidget {
  final String url;
  final CustomImageType type;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit fit;
  final ExtendedImageMode mode;
  final bool enableSlideOutPage;
  final InitGestureConfigHandler? initGestureConfig;
  final Widget Function(
    BuildContext context,
    ImageProvider provider,
    Widget completed,
    Size? size,
  )? builder;

  const CustomImage({
    Key? key,
    required this.url,
    required this.type,
    this.width,
    this.height,
    this.radius,
    this.fit = BoxFit.cover,
    this.builder,
    this.mode = ExtendedImageMode.none,
    this.enableSlideOutPage = false,
    this.initGestureConfig,
  }) : super(key: key);

  const CustomImage.network({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.radius,
    this.fit = BoxFit.cover,
    this.builder,
  })  : type = CustomImageType.network,
        mode = ExtendedImageMode.none,
        enableSlideOutPage = false,
        initGestureConfig = null,
        super(key: key);

  const CustomImage.asset({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.radius,
    this.fit = BoxFit.cover,
    this.builder,
  })  : type = CustomImageType.asset,
        mode = ExtendedImageMode.none,
        enableSlideOutPage = false,
        initGestureConfig = null,
        super(key: key);

  const CustomImage.file({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.radius,
    this.fit = BoxFit.cover,
    this.builder,
  })  : type = CustomImageType.file,
        mode = ExtendedImageMode.none,
        enableSlideOutPage = false,
        initGestureConfig = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(Radius.circular(radius ?? 8.w));
    switch (type) {
      case CustomImageType.asset:
        return ExtendedImage.asset(
          url,
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          mode: mode,
          enableSlideOutPage: enableSlideOutPage,
          initGestureConfigHandler: initGestureConfig,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
      case CustomImageType.network:
        return ExtendedImage.network(
          url,
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          mode: mode,
          enableSlideOutPage: enableSlideOutPage,
          initGestureConfigHandler: initGestureConfig,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
      case CustomImageType.file:
        return ExtendedImage.file(
          File(url),
          width: width,
          height: height,
          fit: fit,
          shape: BoxShape.rectangle,
          borderRadius: borderRadius,
          mode: mode,
          enableSlideOutPage: enableSlideOutPage,
          initGestureConfigHandler: initGestureConfig,
          loadStateChanged: (state) => _buildLoadState(context, state),
        );
    }
  }

  Widget _buildLoadState(BuildContext context, ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return Center(
          child: Image.asset('assets/images/logo.png'),
        );
      // return Center(
      //   child: CustomLoadingIndicator(
      //     size: 30.w,
      //     strokeWidth: 3.w,
      //   ),
      // );
      case LoadState.completed:
        Size? size;
        if (state.extendedImageInfo != null) {
          size = Size(
            state.extendedImageInfo!.image.width.toDouble(),
            state.extendedImageInfo!.image.height.toDouble(),
          );
        }
        final provider = state.imageProvider;
        final completed = state.completedWidget;
        return builder?.call(context, provider, completed, size) ?? completed;
      case LoadState.failed:
        return Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 24.w,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
        );
    }
  }
}
