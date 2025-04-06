import 'package:screen_corner_radius/src/screen_radius.dart';

import 'screen_corner_radius_platform_interface.dart';

class ScreenCornerRadius {
  static Future<ScreenRadius> get() =>
      ScreenCornerRadiusPlatform.instance.getScreenCornerRadius();
}
