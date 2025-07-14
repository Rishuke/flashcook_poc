import 'package:auto_route/auto_route.dart';
import 'package:flashcook_poc/presentation/pages/home_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter() : super();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/home', page: HomeRoute.page, initial: true),
  ];
}
