import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screen_corner_radius_method_channel.dart';

abstract class ScreenCornerRadiusPlatform extends PlatformInterface {
  /// Constructs a ScreenCornerRadiusPlatform.
  ScreenCornerRadiusPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenCornerRadiusPlatform _instance =
      MethodChannelScreenCornerRadius();

  /// The default instance of [ScreenCornerRadiusPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenCornerRadius].
  static ScreenCornerRadiusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenCornerRadiusPlatform] when
  /// they register themselves.
  static set instance(ScreenCornerRadiusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<BorderRadius> getScreenCornerRadius() =>
      throw UnimplementedError(
        'getScreenCornerRadius() has not been implemented.',
      );
}
