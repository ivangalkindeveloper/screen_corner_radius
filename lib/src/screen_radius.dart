class ScreenRadius {
  const ScreenRadius({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });

  factory ScreenRadius.zero() => const ScreenRadius(
    topLeft: 0,
    topRight: 0,
    bottomLeft: 0,
    bottomRight: 0,
  );

  factory ScreenRadius.value(double value) => ScreenRadius(
    topLeft: value,
    topRight: value,
    bottomLeft: value,
    bottomRight: value,
  );

  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

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

  @override
  bool operator ==(covariant ScreenRadius other) {
    if (identical(this, other)) return true;

    return other.topLeft == topLeft &&
        other.topRight == topRight &&
        other.bottomLeft == bottomLeft &&
        other.bottomRight == bottomRight;
  }

  @override
  int get hashCode {
    return topLeft.hashCode ^
        topRight.hashCode ^
        bottomLeft.hashCode ^
        bottomRight.hashCode;
  }
}
