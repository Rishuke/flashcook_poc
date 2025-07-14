import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/services/menu_repository/menu_data_source/menu_firestore_data_source.dart';
import 'data/services/menu_repository/menu_repository.dart';
import 'presentation/bloc/menus_bloc/menus_bloc.dart';
import 'router.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class App extends StatelessWidget {
  App({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MenuRepository(
        menuDataSource: MenuFirestoreDataSource(),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MenusBloc(
              menusRepository: RepositoryProvider.of<MenuRepository>(context),
            ),
          ),
        ],
        child: MaterialApp.router(
          title: 'Flashcook POC',
          // theme: ThemeData.light().copyWith(
          //   extensions: <ThemeExtension<AppTheme>>[lightTheme],
          //   iconTheme: IconThemeData(color: lightTheme.colors.black),
          // ),
          // darkTheme: ThemeData.dark().copyWith(
          //   extensions: <ThemeExtension<AppTheme>>[darkTheme],
          //   iconTheme: IconThemeData(color: lightTheme.colors.white),
          // ),
          // localizationsDelegates: AppLocalizations.localizationsDelegates,
          // supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: _router.config(
            navigatorObservers: () => [routeObserver],
          ),
        ),
      ),
    );
  }
}
