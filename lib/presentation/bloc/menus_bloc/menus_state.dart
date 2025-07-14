part of 'menus_bloc.dart';

enum MenusStatus {
  initial,
  loading,
  success,
  error,
}

final class MenusState {
  final MenusStatus status;
  final List<Menu> menus;
  final Exception? error;

  MenusState({
    this.status = MenusStatus.initial,
    this.menus = const [],
    this.error,
  });
}
