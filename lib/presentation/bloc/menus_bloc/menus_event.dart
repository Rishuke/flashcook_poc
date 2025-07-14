part of 'menus_bloc.dart';

@immutable
sealed class MenusEvent {}

final class GetAllMenus extends MenusEvent {}

final class CreateMenu extends MenusEvent {
  final String title;
  final String description;

  CreateMenu({
    required this.title,
    required this.description,
  });
}

final class UpdateMenu extends MenusEvent {
  final Menu menu;

  UpdateMenu({
    required this.menu,
  });
}
