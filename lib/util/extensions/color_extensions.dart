import 'dart:ui';

extension ColorExtensions on Color {
  Color setOpacity(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withValues(alpha: (255.0 * opacity).roundToDouble());
  }
}
