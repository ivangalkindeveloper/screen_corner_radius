import 'package:screen_corner_radius/src/screen_radius.dart';

import 'screen_corner_radius_platform_interface.dart';

/// A Flutter plugin that provides access to the device screen's corner radius values.
///
/// This plugin allows you to retrieve the actual corner radius values of the device's
/// screen, which is particularly useful for creating UI elements that match the
/// physical characteristics of modern devices with rounded corners.
///
/// ## Supported Platforms
/// - **Android**: Uses the [Rounded Corner APIs](https://developer.android.com/about/versions/12/features?hl=ru#rounded_corner_apis)
///   with the [getRoundedCorner](https://developer.android.com/reference/android/view/WindowInsets?hl=en#getRoundedCorner(int))
///   method to determine screen radii.
/// - **iOS**: Uses the [UIScreen](https://developer.apple.com/documentation/uikit/uiscreen)
///   object extension with the `_displayCornerRadius` key parameter to determine
///   screen radius.
///
/// ## Usage
///
/// ```dart
/// import 'package:screen_corner_radius/screen_corner_radius.dart';
///
/// // Get screen corner radius values
/// final ScreenRadius? screenRadius = await ScreenCornerRadius.get();
///
/// if (screenRadius != null) {
///   // Use the radius values in your UI
///   final borderRadius = BorderRadius.only(
///     topLeft: Radius.circular(screenRadius.topLeft),
///     topRight: Radius.circular(screenRadius.topRight),
///     bottomLeft: Radius.circular(screenRadius.bottomLeft),
///     bottomRight: Radius.circular(screenRadius.bottomRight),
///   );
///
///   // Apply to a widget
///   DecoratedBox(
///     decoration: BoxDecoration(
///       color: Colors.blue,
///       borderRadius: borderRadius,
///     ),
///     child: YourWidget(),
///   );
/// }
/// ```
///
/// ## Return Value
///
/// The method returns a [ScreenRadius] object containing the radius values for
/// all four corners of the screen in logical pixels, or `null` if the corner
/// radius information is not available on the current platform.
///
/// Each corner can have a different radius value, allowing for precise representation
/// of the screen's physical characteristics.
class ScreenCornerRadius {
  /// Retrieves the corner radius values for all four corners of the device screen.
  ///
  /// This method returns a [ScreenRadius] object containing the radius values
  /// for the top-left, top-right, bottom-left, and bottom-right corners of the
  /// screen in logical pixels.
  ///
  /// ## Return Value
  ///
  /// Returns a [Future] that completes with:
  /// - A [ScreenRadius] object containing the corner radius values, or
  /// - `null` if the corner radius information is not available on the current platform
  ///
  /// ## Platform Support
  ///
  /// - **Android**: Requires API level 31+ for full support. On older versions,
  ///   the method may return `null` or default values.
  /// - **iOS**: Works on iOS 11.0+ devices with rounded corners.
  ///
  /// ## Example
  ///
  /// ```dart
  /// // Get screen corner radius
  /// final ScreenRadius? screenRadius = await ScreenCornerRadius.get();
  ///
  /// if (screenRadius != null) {
  ///   print('Top-left corner radius: ${screenRadius.topLeft}');
  ///   print('Top-right corner radius: ${screenRadius.topRight}');
  ///   print('Bottom-left corner radius: ${screenRadius.bottomLeft}');
  ///   print('Bottom-right corner radius: ${screenRadius.bottomRight}');
  /// } else {
  ///   print('Screen corner radius not available');
  /// }
  /// ```
  static Future<ScreenRadius?> get() =>
      ScreenCornerRadiusPlatform.instance.getScreenCornerRadius();
}
