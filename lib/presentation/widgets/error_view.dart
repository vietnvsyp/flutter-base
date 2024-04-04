import 'package:eminel_app/utils/theme.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String title;
  final VoidCallback? callback;
  final String? retryButtonText;
  final MainAxisAlignment? mainAxisAlignment;
  const ErrorView(
    this.title,
    this.callback, {
    this.retryButtonText,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
      child: Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style:
                  TextStyle(color: CustomColors.secondary.color, fontSize: 15),
            ),
          ),
          Center(
            child: TextButton(
              child: Text(
                this.retryButtonText ?? '再取得',
                style: TextStyle(
                    fontSize: 15,
                    color: CustomColors.accent.color,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: callback,
            ),
          ),
        ],
      ),
    );
  }
}
