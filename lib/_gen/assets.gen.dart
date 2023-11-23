/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/alarm.svg
  SvgGenImage get alarm => const SvgGenImage('assets/icons/alarm.svg');

  /// File path: assets/icons/baby.svg
  SvgGenImage get baby => const SvgGenImage('assets/icons/baby.svg');

  /// File path: assets/icons/baby_clothes.svg
  SvgGenImage get babyClothes =>
      const SvgGenImage('assets/icons/baby_clothes.svg');

  /// File path: assets/icons/baby_kick.svg
  SvgGenImage get babyKick => const SvgGenImage('assets/icons/baby_kick.svg');

  /// File path: assets/icons/baby_name.svg
  SvgGenImage get babyName => const SvgGenImage('assets/icons/baby_name.svg');

  /// File path: assets/icons/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/icons/calendar.svg');

  /// File path: assets/icons/chat.svg
  SvgGenImage get chat => const SvgGenImage('assets/icons/chat.svg');

  /// File path: assets/icons/diary.svg
  SvgGenImage get diary => const SvgGenImage('assets/icons/diary.svg');

  /// File path: assets/icons/doctors.svg
  SvgGenImage get doctors => const SvgGenImage('assets/icons/doctors.svg');

  /// File path: assets/icons/group.svg
  SvgGenImage get group => const SvgGenImage('assets/icons/group.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/injection.svg
  SvgGenImage get injection => const SvgGenImage('assets/icons/injection.svg');

  /// File path: assets/icons/knowledge.svg
  SvgGenImage get knowledge => const SvgGenImage('assets/icons/knowledge.svg');

  /// File path: assets/icons/music.svg
  SvgGenImage get music => const SvgGenImage('assets/icons/music.svg');

  /// File path: assets/icons/pregnancy.svg
  SvgGenImage get pregnancy => const SvgGenImage('assets/icons/pregnancy.svg');

  /// File path: assets/icons/weight.svg
  SvgGenImage get weight => const SvgGenImage('assets/icons/weight.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        alarm,
        baby,
        babyClothes,
        babyKick,
        babyName,
        calendar,
        chat,
        diary,
        doctors,
        group,
        home,
        injection,
        knowledge,
        music,
        pregnancy,
        weight
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
