// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [MenuCreateScreen]
class MenuCreateRoute extends PageRouteInfo<void> {
  const MenuCreateRoute({List<PageRouteInfo>? children})
      : super(MenuCreateRoute.name, initialChildren: children);

  static const String name = 'MenuCreateRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MenuCreateScreen();
    },
  );
}

/// generated route for
/// [MenuDetailScreen]
class MenuDetailRoute extends PageRouteInfo<MenuDetailRouteArgs> {
  MenuDetailRoute({Key? key, required Menu menu, List<PageRouteInfo>? children})
      : super(
          MenuDetailRoute.name,
          args: MenuDetailRouteArgs(key: key, menu: menu),
          initialChildren: children,
        );

  static const String name = 'MenuDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MenuDetailRouteArgs>();
      return MenuDetailScreen(key: args.key, menu: args.menu);
    },
  );
}

class MenuDetailRouteArgs {
  const MenuDetailRouteArgs({this.key, required this.menu});

  final Key? key;

  final Menu menu;

  @override
  String toString() {
    return 'MenuDetailRouteArgs{key: $key, menu: $menu}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MenuDetailRouteArgs) return false;
    return key == other.key && menu == other.menu;
  }

  @override
  int get hashCode => key.hashCode ^ menu.hashCode;
}

/// generated route for
/// [MenusScreen]
class MenusRoute extends PageRouteInfo<void> {
  const MenusRoute({List<PageRouteInfo>? children})
      : super(MenusRoute.name, initialChildren: children);

  static const String name = 'MenusRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MenusScreen();
    },
  );
}
