/// A data class representing the corner radius values for all four corners of a device screen.
///
/// This class is used by the [ScreenCornerRadius] plugin to return the actual
/// corner radius values detected from the device's screen. Each corner can have
/// a different radius value, allowing for precise representation of the screen's
/// physical characteristics.
///
/// Example usage:
/// ```dart
/// final ScreenRadius? screenRadius = await ScreenCornerRadius.get();
/// if (screenRadius != null) {
///   // Use the radius values in your UI
///   final borderRadius = BorderRadius.only(
///     topLeft: Radius.circular(screenRadius.topLeft),
///     topRight: Radius.circular(screenRadius.topRight),
///     bottomLeft: Radius.circular(screenRadius.bottomLeft),
///     bottomRight: Radius.circular(screenRadius.bottomRight),
///   );
/// }
/// ```
final class ScreenRadius {
  /// Creates a [ScreenRadius] instance with specific radius values for each corner.
  ///
  /// All parameters are required and represent the radius in logical pixels.
  const ScreenRadius({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });

  /// Creates a [ScreenRadius] instance where all corners have the same radius value.
  ///
  /// This is useful when you want to apply a uniform radius to all corners.
  ///
  /// Example:
  /// ```dart
  /// const uniformRadius = ScreenRadius.value(16.0);
  /// ```
  factory ScreenRadius.value(double value) => ScreenRadius(
    topLeft: value,
    topRight: value,
    bottomLeft: value,
    bottomRight: value,
  );

  /// The radius of the top-left corner in logical pixels.
  final double topLeft;

  /// The radius of the top-right corner in logical pixels.
  final double topRight;

  /// The radius of the bottom-left corner in logical pixels.
  final double bottomLeft;

  /// The radius of the bottom-right corner in logical pixels.
  final double bottomRight;

  /// Creates a copy of this [ScreenRadius] with the given fields replaced with new values.
  ///
  /// Any parameter that is null will use the current value from this instance.
  ///
  /// Example:
  /// ```dart
  /// final original = ScreenRadius.value(8.0);
  /// final modified = original.copyWith(topLeft: 16.0, bottomRight: 12.0);
  /// // Result: topLeft=16.0, topRight=8.0, bottomLeft=8.0, bottomRight=12.0
  /// ```
  ScreenRadius copyWith({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) => ScreenRadius(
    topLeft: topLeft ?? this.topLeft,
    topRight: topRight ?? this.topRight,
    bottomLeft: bottomLeft ?? this.bottomLeft,
    bottomRight: bottomRight ?? this.bottomRight,
  );

  /// Compares two [ScreenRadius] instances for equality.
  ///
  /// Two instances are considered equal if all their corner radius values
  /// are equal. This method is used by the `==` operator.
  @override
  bool operator ==(covariant ScreenRadius other) {
    if (identical(this, other)) {
      return true;
    }

    return other.topLeft == topLeft &&
        other.topRight == topRight &&
        other.bottomLeft == bottomLeft &&
        other.bottomRight == bottomRight;
  }

  /// Returns a hash code for this [ScreenRadius] instance.
  ///
  /// The hash code is computed by combining the hash codes of all corner
  /// radius values using XOR operation.
  @override
  int get hashCode =>
      topLeft.hashCode ^
      topRight.hashCode ^
      bottomLeft.hashCode ^
      bottomRight.hashCode;
}
