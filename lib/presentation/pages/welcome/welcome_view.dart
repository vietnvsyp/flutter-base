import 'package:eminel_app/l10n/l10n.dart';
import 'package:eminel_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeView extends StatelessWidget {
  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return _BuildPage();
  }
}

class _BuildPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _cleanupStates(ref);
    final l10n = L10n.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      return Image.asset('${Util.assetPath}/img/welcome.png');
                    case 1:
                      return Container(
                        margin: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                        child: Text(
                          l10n.pageWelcomeTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      );
                    default:
                      return Container();
                  }
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _cleanupStates(WidgetRef ref) {
    // TODO: cleanup state
  }
}
