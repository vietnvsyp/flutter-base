import 'package:eminel_app/utils/theme.dart';
import 'package:flutter/material.dart';

Widget loadingView({Color backgroundColor = Colors.white}) {
  return Container(
    color: backgroundColor,
    child: Center(
      child: CircularProgressIndicator(
        color: CustomColors.accent.color,
      ),
    ),
  );
}
