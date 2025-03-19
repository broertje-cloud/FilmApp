import 'package:flutter/material.dart';

/// Common spacing widgets to maintain consistent UI spacing.
class UIHelper {
  // Vertical Spacing
  static const SizedBox verticalSpaceSmall = SizedBox(height: 8);
  static const SizedBox verticalSpaceMedium = SizedBox(height: 16);
  static const SizedBox verticalSpaceLarge = SizedBox(height: 24);

  // Horizontal Spacing
  static const SizedBox horizontalSpaceSmall = SizedBox(width: 8);
  static const SizedBox horizontalSpaceMedium = SizedBox(width: 16);
  static const SizedBox horizontalSpaceLarge = SizedBox(width: 24);
}

/// Common TextStyles to maintain a consistent look.
class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: Colors.grey,
  );
}
