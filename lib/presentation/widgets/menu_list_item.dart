import 'package:flutter/material.dart';

import '../../data/model/menu.dart';

class MenuListItem extends StatelessWidget {
  const MenuListItem({
    super.key,
    required this.menu,
    this.onTap,
  });

  final Menu menu;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(menu.title),
      subtitle: Text(menu.description),
      onTap: onTap,
    );
  }
}
