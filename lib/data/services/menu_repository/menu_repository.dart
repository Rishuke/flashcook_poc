import '../../model/menu.dart';
import 'menu_data_source/menu_data_source.dart';

import '../../../exception/app_exception.dart';
import 'package:either_dart/either.dart';
import 'package:rxdart/rxdart.dart';

final class MenuRepository {
  final MenuDataSource _menuDataSource;
  final _menuStreamController = BehaviorSubject<Menu?>.seeded(null);

  MenuRepository({
    required MenuDataSource menuDataSource,
  }) : _menuDataSource = menuDataSource;

  Stream<Menu?> get menuStream => _menuStreamController.stream;

  Future<Menu> getMenu(String menuId) async {
    try {
      final menu = await _menuDataSource.getMenu(menuId);
      _menuStreamController.add(menu);
      return menu;
    } catch (error) {
      throw AppException.from(error);
    }
  }

  Future<Either<AppException, List<Menu>>> getAllMenus() async {
    try {
      final menus = await _menuDataSource.getAllMenus();
      return Right(menus);
    } catch (error) {
      return Left(AppException.from(error));
    }
  }

  Future<Either<AppException, void>> createMenu({
    required Menu menu,
  }) async {
    try {
      await _menuDataSource.createMenu(menu: menu);
      return Right(null);
    } catch (error) {
      return Left(AppException.from(error));
    }
  }

  Future<Either<AppException, void>> updateMenu(Menu menu) async {
    try {
      await _menuDataSource.updateMenu(menu);
      _menuStreamController.add(menu);
      return Right(null);
    } catch (error) {
      return Left(AppException.from(error));
    }
  }

  void dispose() {
    _menuStreamController.close();
  }
}
