import 'package:flutter/material.dart';

class GlobalValues {
  // 0 -> Noche
  // 1 -> Dia
  // 2 -> Calido

  static ValueNotifier<int> banTheme = ValueNotifier(1);
}