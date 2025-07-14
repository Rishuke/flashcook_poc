import 'package:auto_route/auto_route.dart';
import 'package:flashcook_poc/presentation/widgets/menu_list_item.dart';
import '../bloc/menus_bloc/menus_bloc.dart';
import 'menu_create_screen.dart';
import '../../router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MenusScreen extends StatefulWidget {
  const MenusScreen({super.key});

  @override
  State<MenusScreen> createState() => _MenusScreenState();
}

class _MenusScreenState extends State<MenusScreen> {
  @override
  void initState() {
    super.initState();
    final menusBloc = BlocProvider.of<MenusBloc>(context);
    menusBloc.add(GetAllMenus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menus'),
      ),
      body: BlocBuilder<MenusBloc, MenusState>(
        builder: (context, state) {
          return switch (state.status) {
            MenusStatus.loading =>
              const Center(child: CircularProgressIndicator()),
            MenusStatus.error => Center(child: Text('Erreur: ${state.error}')),
            MenusStatus.success when state.menus.isEmpty =>
              const Center(child: Text('Aucun menu trouvé')),
            MenusStatus.success => ListView.builder(
                itemCount: state.menus.length,
                itemBuilder: (context, index) {
                  final menu = state.menus[index];
                  return MenuListItem(
                    menu: menu,
                    onTap: () {
                      context.pushRoute(MenuDetailRoute(menu: menu));
                    },
                  );
                },
              ),
            _ => const SizedBox.shrink(),
          };
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => MenuCreateScreen.navigateTo(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
