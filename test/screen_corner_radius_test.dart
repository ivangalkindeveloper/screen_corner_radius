import 'package:flutter_test/flutter_test.dart';
import 'package:screen_corner_radius/src/screen_corner_radius.dart';
import 'package:screen_corner_radius/src/screen_corner_radius_platform_interface.dart';
import 'package:screen_corner_radius/src/screen_corner_radius_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:screen_corner_radius/src/screen_radius.dart';

class MockScreenCornerRadiusPlatform
    with MockPlatformInterfaceMixin
    implements ScreenCornerRadiusPlatform {
  @override
  Future<ScreenRadius> getScreenCornerRadius() async => ScreenRadius.value(62);
}

void main() {
  final ScreenCornerRadiusPlatform initialPlatform =
      ScreenCornerRadiusPlatform.instance;

  test('$MethodChannelScreenCornerRadius is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenCornerRadius>());
  });

  test('getScreenCornerRadius', () async {
    MockScreenCornerRadiusPlatform fakePlatform =
        MockScreenCornerRadiusPlatform();
    ScreenCornerRadiusPlatform.instance = fakePlatform;

    expect(await ScreenCornerRadius.get(), ScreenRadius.value(62));
  });
}
