import 'package:eminel_app/utils/theme.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String title;
  const EmptyView(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              style:
                  TextStyle(color: CustomColors.secondary.color, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
