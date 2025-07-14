import 'package:auto_route/auto_route.dart';
import 'data/model/menu.dart';
import 'presentation/pages/menu_create_screen.dart';
import 'presentation/pages/menu_detail_screen.dart';
import 'presentation/pages/menu_screen.dart';
import 'package:flutter/foundation.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter() : super();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/menu', page: MenusRoute.page, initial: true),
    AutoRoute(path: '/menuCreate', page: MenuCreateRoute.page),
    AutoRoute(path: '/menuDetail', page: MenuDetailRoute.page),
  ];
}
