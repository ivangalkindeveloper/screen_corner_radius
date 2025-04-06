import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screen_corner_radius/screen_corner_radius.dart';
import 'package:screen_corner_radius/src/screen_corner_radius_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelScreenCornerRadius platform = MethodChannelScreenCornerRadius();
  const MethodChannel channel = MethodChannel('screen_corner_radius');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          channel,
          (MethodCall methodCall) async => {
            "topLeft": 62.0,
            "topRight": 62.0,
            "bottomLeft": 62.0,
            "bottomRight": 62.0,
          },
        );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getScreenCornerRadius', () async {
    expect(await platform.getScreenCornerRadius(), ScreenRadius.value(62));
  });
}
