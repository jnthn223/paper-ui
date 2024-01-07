import 'package:flutter/material.dart';

enum Sizes { xs, sm, md, lg, xl, x2l }

double getFontSize(Sizes? size) {
  switch (size) {
    case Sizes.xs:
      return 12.0;
    case Sizes.sm:
      return 14.0;
    case Sizes.md:
      return 16.0;
    case Sizes.lg:
      return 18.0;
    case Sizes.xl:
      return 20.0;
    case Sizes.x2l:
      return 24.0;
    default:
      return 14.0;
  }
}

EdgeInsets getPadding(Sizes? size) {
  switch (size) {
    case Sizes.xs:
      return const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0);
    case Sizes.sm:
      return const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0);
    case Sizes.md:
      return const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0);
    case Sizes.lg:
      return const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);
    case Sizes.xl:
      return const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0);
    default:
      return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0);
  }
}

double getButtonRadius(Sizes? size) {
  switch (size) {
    case Sizes.xs:
      return 8.0;
    case Sizes.sm:
      return 10.0;
    case Sizes.md:
      return 12.0;
    case Sizes.lg:
      return 14.0;
    case Sizes.xl:
      return 16.0;
    default:
      return 10.0;
  }
}

double getShadowButtonSize(Sizes? size) {
  switch (size) {
    case Sizes.xs:
    case Sizes.sm:
      return 2.0;
    case Sizes.md:
    case Sizes.lg:
    case Sizes.xl:
      return 4.0;
    default:
      return 2.0;
  }
}

double getButtonBorderSize(Sizes? size) {
  switch (size) {
    case Sizes.xs:
    case Sizes.sm:
      return 1.25;
    case Sizes.md:
    case Sizes.lg:
    case Sizes.xl:
      return 2.0;
    default:
      return 1.25;
  }
}
