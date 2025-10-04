import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:screen_corner_radius/src/screen_radius.dart';

import 'screen_corner_radius_platform_interface.dart';

/// An implementation of [ScreenCornerRadiusPlatform] that uses method channels.
class MethodChannelScreenCornerRadius extends ScreenCornerRadiusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screen_corner_radius');

  @override
  Future<ScreenRadius?> getScreenCornerRadius() async {
    final Map<String, double>? result = (await methodChannel.invokeMethod<Map>(
      'getScreenCornerRadius',
    ))?.cast<String, double>();
    if (result == null) {
      return null;
    }

    return ScreenRadius(
      topLeft: result["topLeft"] ?? 0,
      topRight: result["topRight"] ?? 0,
      bottomLeft: result["bottomLeft"] ?? 0,
      bottomRight: result["bottomRight"] ?? 0,
    );
  }
}
