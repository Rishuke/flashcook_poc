import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../exception/app_exception.dart';
import '../../../model/menu.dart';
import 'menu_data_source.dart';

class MenuFirestoreDataSource extends MenuDataSource {
  final FirebaseFirestore _firestore;

  MenuFirestoreDataSource({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Menu> getMenu(String menuId) async {
    try {
      final menuDocRef = _firestore.collection('menus').doc(menuId);
      final doc = await menuDocRef.get();

      if (!doc.exists) {
        throw Exception('Menu not found');
      }

      return Menu.fromJson(doc.data()!);
    } catch (error) {
      throw AppException.from(error);
    }
  }

  @override
  Future<List<Menu>> getAllMenus() async {
    try {
      final snapshot = await _firestore.collection('menus').get();

      final menus =
          snapshot.docs.map((doc) => Menu.fromJson(doc.data())).toList();

      return menus;
    } catch (error) {
      throw AppException.from(error);
    }
  }

  @override
  Future<void> createMenu({
    required Menu menu,
  }) async {
    try {
      final docRef = _firestore.collection('menus').doc(menu.id);

      await docRef.set({
        ...menu.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (error) {
      throw AppException.from(error);
    }
  }

  @override
  Future<void> updateMenu(Menu menu) async {
    try {
      final docRef = _firestore.collection('menus').doc(menu.id);

      await docRef.update({
        'title': menu.title,
        'description': menu.description,
      });
    } catch (error) {
      throw AppException.from(error);
    }
  }
}
