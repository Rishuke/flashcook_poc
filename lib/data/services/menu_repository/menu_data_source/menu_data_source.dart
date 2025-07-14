import '../../../model/menu.dart';

abstract class MenuDataSource {
  Future<Menu> getMenu(String menuId);

  Future<List<Menu>> getAllMenus();
  Future<void> createMenu({
    required Menu menu,
  });

  Future<void> updateMenu(Menu menu);
}
