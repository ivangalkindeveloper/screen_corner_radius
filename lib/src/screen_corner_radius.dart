import 'package:flutter/widgets.dart';

import 'screen_corner_radius_platform_interface.dart';

class ScreenCornerRadius {
  static Future<BorderRadius> get() =>
      ScreenCornerRadiusPlatform.instance.getScreenCornerRadius();
}
