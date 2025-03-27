import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'screen_corner_radius_platform_interface.dart';

/// An implementation of [ScreenCornerRadiusPlatform] that uses method channels.
class MethodChannelScreenCornerRadius extends ScreenCornerRadiusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screen_corner_radius');

  @override
  Future<BorderRadius> getScreenCornerRadius() async {
    final Map<String, double>? result =
        (await methodChannel.invokeMethod<Map>(
          'getScreenCornerRadius',
        ))?.cast<String, double>();
    if (result == null) {
      return BorderRadius.zero;
    }

    return BorderRadius.only(
      topLeft: Radius.circular(result["topLeft"] ?? 0),
      topRight: Radius.circular(result["topRight"] ?? 0),
      bottomLeft: Radius.circular(result["bottomLeft"] ?? 0),
      bottomRight: Radius.circular(result["bottomRight"] ?? 0),
    );
  }
}
