import 'package:bloc/bloc.dart';
import '../../../data/services/menu_repository/menu_repository.dart';
import '../../../data/model/menu.dart';
import 'package:flutter/foundation.dart';

part 'menus_event.dart';
part 'menus_state.dart';

class MenusBloc extends Bloc<MenusEvent, MenusState> {
  final MenuRepository menusRepository;

  MenusBloc({required this.menusRepository}) : super(MenusState()) {
    on<GetAllMenus>(_onGetAllMenus);
    on<CreateMenu>(_onCreateMenu);
    on<UpdateMenu>(_onUpdateMenu);
  }

  void _onGetAllMenus(GetAllMenus event, Emitter<MenusState> emit) async {
    emit(MenusState(status: MenusStatus.loading));

    try {
      final menus = await menusRepository.getAllMenus();
      menus.fold(
        (error) {
          emit(MenusState(status: MenusStatus.error, error: error));
        },
        (menusList) {
          emit(MenusState(
            status: MenusStatus.success,
            menus: menusList,
          ));
        },
      );
    } catch (error) {
      emit(MenusState(
        status: MenusStatus.error,
        error: error as Exception,
      ));
    }
  }

  void _onCreateMenu(CreateMenu event, Emitter<MenusState> emit) async {
    emit(MenusState(status: MenusStatus.loading));

    final result = await menusRepository.createMenu(
      menu: Menu(
        id: DateTime.now().toIso8601String(),
        title: event.title,
        description: event.description,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    result.fold(
      (failure) => emit(MenusState(status: MenusStatus.error, error: failure)),
      (_) => add(GetAllMenus()),
    );
  }

  void _onUpdateMenu(UpdateMenu event, Emitter<MenusState> emit) async {
    emit(MenusState(status: MenusStatus.loading));

    final result = await menusRepository.updateMenu(event.menu);

    result.fold(
      (failure) => emit(MenusState(status: MenusStatus.error, error: failure)),
      (_) => add(GetAllMenus()),
    );
  }
}
