import 'package:flutter/material.dart';

class NeutralColors extends ColorSwatch<int> {
  const NeutralColors(super.primary, super.swatch);
  Color get shade40 => this[40]!;

  Color get shade50 => this[50]!;

  Color get shade60 => this[60]!;

  Color get shade70 => this[70]!;

  Color get shade80 => this[80]!;

  Color get shade90 => this[90]!;

  Color get shade100 => this[100]!;

  Color get shade200 => this[200]!;

  Color get shade300 => this[300]!;

  Color get shade400 => this[400]!;

  /// The default shade.
  Color get shade500 => this[500]!;

  Color get shade600 => this[600]!;

  Color get shade700 => this[700]!;

  Color get shade800 => this[800]!;

  Color get shade900 => this[900]!;
}

class PrimaryColors extends ColorSwatch<int> {
  const PrimaryColors(super.primary, super.swatch);

  Color get shade50 => this[50]!;

  /// The default shade.
  Color get shade500 => this[500]!;
}

class BlueColors extends ColorSwatch<int> {
  const BlueColors(super.primary, super.swatch);

  // Color get shade100 => this[100]!;

  // Color get shade200 => this[200]!;

  // Color get shade300 => this[300]!;

  // Color get shade400 => this[400]!;

  /// The default shade.
  Color get shade500 => this[500]!;

  Color get shade600 => this[600]!;

  Color get shade700 => this[700]!;

  Color get shade800 => this[800]!;

  Color get shade900 => this[900]!;

  Color get shade1000 => this[1000]!;
}
