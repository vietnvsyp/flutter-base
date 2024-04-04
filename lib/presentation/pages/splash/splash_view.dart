import 'package:eminel_app/data/datastores/news_repository_impl.dart';
import 'package:eminel_app/domain/usecases/news_usecase_impl.dart';
import 'package:eminel_app/presentation/pages/welcome/welcome_view.dart';
import 'package:eminel_app/presentation/widgets/loading_view.dart';
import 'package:eminel_app/server/mui_service.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  static const routeName = '/';

  @override
  State<SplashView> createState() => new _SplashState();
}

class _SplashState extends State<SplashView> {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  void initState() {
    // TODO: fetchData
    _fetchStartupData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: loadingView(),
    );
  }

  Future<void> _fetchStartupData() async {
    try {
      final _userUsecase = NewsUsecaseImpl(NewsRepositoryImpl(MuiService()));

      final news = _userUsecase.getAllNews(
          'tesla', '2024-03-04', '075638a685454e01bdaaa8838687321e');
      print('news = $news');

      if (!context.mounted) return;
      _transitionHomeView(context);
    } catch (e) {
      // AuthErrorなど
      _transitionWelcomeView(context);
    }
  }

  _transitionWelcomeView(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              WelcomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(child: child, opacity: animation);
          },
        ),
        (_) => false);
  }

  _transitionHomeView(BuildContext context) {
    print('HomeView');
    //   TODO: transition HomeView
  }
}
